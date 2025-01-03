# ci-security

Purpose of this repository is to teach you how to add basic security safetyguards into continuous integration.

- Code: <https://github.com/Rinorragi/ci-security>
- Slides: <https://rinorragi.github.io/ci-security/>

## Apps

Apps are pretty boring.

- [uptodate-app](https://github.com/Rinorragi/ci-security/tree/main/apps/uptodate-app) is just plain empty template done with `dotnet new mvc`
- [vulnerable-app](https://github.com/Rinorragi/ci-security/tree/main/apps/vulnerable-app) is similarly done with `dotnet new mvc` but there are some vulns added for you to find with the labs

## Labs

- [Lab01 - Hello GitHub Actions](/labs/lab01-hello-github-actions/README.md)
- [Lab02 - Branch protections](/labs/lab02-branch-protections/README.md)
- [Lab03 - Software Composition Analysis](/labs/lab03-sca/)
- [Lab04 - Package locks](/labs/lab04-package-locks/README.md)
- [Lab05 - License check](/labs/lab05-license-check/)
- [Lab06 - Static Application Security Testing](/labs/lab06-sast/README.md)
- [Lab07 - Secret scanning](/labs/lab07-secret-scanning/README.md)
- [Lab08 - IaC scanning](/labs/lab08-iac-scanning/README.md)
- [Lab09 - HTTP header scanning](/labs/lab09-http-header-scanning/README.md)
- [Lab10 - TLS cipher scanning](/labs/lab10-tls-scanning/README.md)
