# TPM2 playground

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
tpm2_dictionarylockout --setup-parameters --max-tries=5
```
