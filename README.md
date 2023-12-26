# TPM2 playground

## Dictionary Attack Lockout

```
tpm2_getcap properties-variable | grep TPM2_PT_MAX_AUTH_FAIL
tpm2_getcap properties-variable | grep TPM2_PT_LOCKOUT_COUNTER
```

```
tpm2_dictionarylockout --clear-lockout
tpm2_dictionarylockout --setup-parameters --max-tries=5
```
