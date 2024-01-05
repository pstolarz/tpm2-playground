#include <malloc.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "tss2/tss2_fapi.h"
#include "tss2/tss2_rc.h"
#include "openssl/sha.h"

#define ALWAYS_CREATE 0

#define CHECK_TSS_RC(_cmd, _fnc)     \
    {                                \
        TSS2_RC rc = (_cmd);         \
        if (rc != TSS2_RC_SUCCESS) { \
            printf("%s() FAILED [0x%08x]: %s\n", (_fnc), (int)rc, Tss2_RC_Decode(rc)); \
            goto finish;             \
        }                            \
    }

int main(int argc, const char *argv[])
{
    size_t signLen = 0;
    uint8_t *sign = NULL;
    char *pubKey = NULL;
    char *cert = NULL;
    char *listPath = NULL;

    TSS2_RC rc;
    FAPI_CONTEXT *context = NULL;

    CHECK_TSS_RC(
        Fapi_Initialize(&context, NULL),
        "Fapi_Initialize");

    bool createKey = true;
    const char *signKeyPath = "/HS/SRK/SignKey";

    rc = Fapi_List(context,
            signKeyPath, &listPath);

    if (rc == TSS2_RC_SUCCESS)
    {
#if ALWAYS_CREATE
        CHECK_TSS_RC(
            Fapi_Delete(context, signKeyPath),
            "Fapi_Delete");
#else
        createKey = false;
#endif
    }

    if (createKey)
    {
        CHECK_TSS_RC(
            Fapi_CreateKey(context,
                signKeyPath,
                "sign",
                NULL,
                NULL),
            "Fapi_CreateKey");
    }

    char signIn[] = "pstolarz";
    uint8_t digest[SHA256_DIGEST_LENGTH];

    SHA256((uint8_t*)signIn, sizeof(signIn), digest);

    CHECK_TSS_RC(
        Fapi_Sign(context,
            signKeyPath,
            NULL,
            digest, sizeof(digest),
            &sign, &signLen,
            &pubKey,
            &cert),
        "Fapi_Sign");

    if (strlen(pubKey))
        printf("Public key:\n%s\n", pubKey);

    if (strlen(cert) > 0)
        printf("Ceretificate:\n%s\n", cert);

    CHECK_TSS_RC(
        Fapi_VerifySignature(context,
            signKeyPath,
            digest, sizeof(digest),
            sign, signLen),
        "Fapi_VerifySignature");

    printf("Signature verified successfully!\n");

finish:
    if (sign)
        Fapi_Free(sign);
    if (pubKey)
        Fapi_Free(pubKey);
    if (cert)
        Fapi_Free(cert);
    if (listPath)
        Fapi_Free(listPath);
    if (context)
        Fapi_Finalize(&context);

    return 0;
}
