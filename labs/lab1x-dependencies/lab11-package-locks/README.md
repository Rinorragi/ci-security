# Lab13 - Create Package Lock

| Title          | Description                                                                                                                         |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Target         | Learn to lock exact versions of transient dependencies (not direct)                                                                 |
| Difficulty     | Easy                                                                                                                                |
| Measure        | Dependencies and their exact versions                                                                                               |
| Threat         | Package maintainer goes rogue and would publish new malicious patch version of a dependency that you are transiently dependant upon |
| Detect         | N/A                                                                                                                                 |
| Prevent        | Changes in any dependency without you deliberately updating them                                                                    |
| Stage          | Build                                                                                                                               |
| Known problems | Ecosystems tend to act differently on this matter                                                                                   |

Package locks are files (e.g., `packages.lock.json` for .NET or `package-lock.json` for Node.js) that record the exact versions of your direct and transitive dependencies at the time they were installed.

By locking dependencies to specific versions, you achieve:

- **Reproducible Builds**
  - A package lock guarantees that every environment — local, test, or production — uses precisely the same versions of each library. This consistency helps avoid “it works on my machine” scenarios and ensures that the entire team or pipeline shares a uniform set of dependencies.
- **Improved Security**
  - Lock files help identify vulnerabilities more easily and prevent automatically pulling in newer libraries that could introduce critical security flaws. When your dependencies are locked, scanners and security tools can reliably track known CVEs for each version used, making it easier to mitigate risks.
- **Predictable Updates**
  - With a package lock, you have fine-grained control over when and how dependencies get updated. You won’t suddenly break a build or introduce unexpected behavior just because a newly released version of a sub-dependency sneaked into your workflow. Instead, you explicitly decide when to update and test new versions.

As is maybe obvious from the above, package locks are relevant in the build phase of your CI/CD pipelines.

In this lab, you’ll learn how to set up and leverage package locks in GitHub Actions.

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

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab11-create-package-lock.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab11-create-package-lock.yml>
