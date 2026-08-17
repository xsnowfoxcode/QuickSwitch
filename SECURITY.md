# Security and Release Verification

QuickSwitch is a local Windows utility. It does not include an update service or send `Errors.log` to the maintainer. Runtime diagnostics are written beside the application and may contain local paths or application names, so do not publish them without redaction.

## Download only from this fork

Fork releases are published at:

<https://github.com/xsnowfoxcode/QuickSwitch/releases>

This fork does not claim the original maintainer's code-signing certificate or digital signature. The v1.9.1 release is verified with GitHub's asset SHA-256 digest instead.

## Verify an archive

After downloading an archive, compare its hash with the digest shown on the matching GitHub Release:

```powershell
(Get-FileHash .\QuickSwitch-1.9.1-x64.zip -Algorithm SHA256).Hash
```

The displayed value must match the release asset digest. Use the `x32` archive only on a 32-bit Windows system.

## Report a problem

Please open a report in the [fork issue tracker](https://github.com/xsnowfoxcode/QuickSwitch/issues/new/choose). Remove usernames, machine names, network share names, credentials, and other private paths from logs before attaching them.

## Upstream security context

This repository is a GPL-3.0 fork of [JoyHak/QuickSwitch](https://github.com/JoyHak/QuickSwitch). Security issues affecting the upstream code may also be reported to the upstream project when appropriate; fork-specific fixes should be reported here.
