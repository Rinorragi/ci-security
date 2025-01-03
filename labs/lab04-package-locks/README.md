# Lab04 - Create Package Lock

## Find vulnerabilities from dependencies

Create package locks for the `ci-security.sln`. Normally you would do this in your own machine and then push. But for the sake of training GitHub actions add the package-lock file in GitHub Actions pipeline and then build with locked-mode (in normal situation .NET does implicit restore).

1. Create package lock file in GitHub Actions
1. Restore with locked mode
1. Build software without implicit restore
1. Print out the contents of package lock file.

## Links

- Dotnet restore command: <https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-restore>
- Dotnet build command: <https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-build>
- NPM package lock: <https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/main/.github/workflows/lab04-create-package-lock.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab04-create-package-lock.yml>
