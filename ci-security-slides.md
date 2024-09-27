# Security safeguards in Continuous Integration

Rinorragi & Co

## Prerequisites

- GitHub account with public repository
- Text editor
- git

---

## GitHub Actions

---

## Security tools in continuous integration

## Branch protections

Something about the importance of pull request approvals and protected branches

## Check dependencies

Why to check dependencies
How to run one or more of the following in ci

- OWASP Dependency Check
- npm audit
- dotnet list package --vulnerable in pipeline.

## Package locks

Why to lock packages and how to do it and how to generate bill of materials.

## License checks

How to check open source licenses used in project.


## Static code analysis

How to scan code for vulnerabilities e.g. with CodeQL (or GitHub Advanced Security). 

## Secret scanning

E.g. how to use gitleaks to check for hard-coded password, api keys and such

## Infrastructure as Code scanning

e.g. checkov
