# TPM2 playground

## Doc and Resources
* [TPM Resources Base](https://trustedcomputinggroup.org/resources)
* TPM 2.0
  * [Brief Introduction](https://trustedcomputinggroup.org/resource/trusted-platform-module-2-0-a-brief-introduction)
  * [Main Specification](https://trustedcomputinggroup.org/resource/tpm-library-specification)
  * [Errata](https://trustedcomputinggroup.org/resource/errata-for-tpm-library-specification-2-0)
* TPM 1.2
  * [Main Specification](https://trustedcomputinggroup.org/resource/tpm-main-specification)
* TPM TSS 2
  * [TPM TSS 2 Brief Overview](https://trustedcomputinggroup.org/resource/creating-complete-trusted-computing-ecosystem-overview-trusted-software-stack-tss-2-0)
  * [Overview and Common Structures](https://trustedcomputinggroup.org/resource/tss-overview-common-structures-specification)
  * [Feature API](https://trustedcomputinggroup.org/resource/tss-fapi)
  * [Enhanced System API](https://trustedcomputinggroup.org/resource/tcg-tss-2-0-enhanced-system-api-esapi-specification)
  * [System API](https://trustedcomputinggroup.org/resource/tcg-tss-2-0-system-level-api-sapi-specification)
  * [Marshaling and Unmarshaling API](https://trustedcomputinggroup.org/resource/tcg-tss-2-0-marshalingunmarshaling-api-specification)
  * [TCTI API](https://trustedcomputinggroup.org/resource/tss-tcti-specification)
  * [TAB and RM](https://trustedcomputinggroup.org/resource/tss-tab-and-resource-manager)
  * [Response Codes API](https://trustedcomputinggroup.org/resource/tcg-tss-2-0-response-code-api-specification)
  * [JSON Data Types and Policy Language](https://trustedcomputinggroup.org/resource/tcg-tss-json)
* [TPM TSS 1.2](https://trustedcomputinggroup.org/resource/tcg-software-stack-tss-specification)
* Registry
  * [Algorithms](https://trustedcomputinggroup.org/resource/tcg-algorithm-registry)
  * [Handles and Localities](https://trustedcomputinggroup.org/resource/registry)
  * [Vendors](https://trustedcomputinggroup.org/resource/vendor-id-registry)
* Other
  * [A Practical Guide to TPM 2.0](https://trustedcomputinggroup.org/resource/a-practical-guide-to-tpm-2-0/)
  * [How to Use TPM](https://trustedcomputinggroup.org/resource/how-to-use-the-trusted-platform-module-tpm-for-trust-and-security)
  * [TCG Glossary](https://trustedcomputinggroup.org/resource/tcg-glossary)

## Configuration notes

* Set `"ek_cert_less": "yes"` in `/etc/tpm2-tss/fapi-config.json` to disable
  endorsement cert verification.
* D-Bus configuration needs to be updated by adding `tpm2-abrmd.conf` to
  `/etc/dbus-1/system.d/` to enable `com.intel.tss2.Tabrmd` name assignment to
  `tabrmd` service.

## Dictionary Attack Lockout

```
tpm2_getcap properties-variable | grep TPM2_PT_MAX_AUTH_FAIL
tpm2_getcap properties-variable | grep TPM2_PT_LOCKOUT_COUNTER
```

```
tpm2_dictionarylockout --clear-lockout
tpm2_dictionarylockout --setup-parameters --max-tries=NUM
```
