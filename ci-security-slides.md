# Security safeguards in Continuous Integration

Rinorragi & Co

--slide---

## Prerequisites

- GitHub account with public repository
- Text editor
- git

---page---

## GitHub Actions

--slide---

## Lab: GitHub Actions

Lab for creating Hello GitHub Actions

---page---

## Branch protections

Something about the importance of pull request approvals and protected branches

--slide---

## Lab: Branch protections

Lab for setting up branch protections

---page---

## Check dependencies

Why to check dependencies
How to run one or more of the following in ci

- OWASP Dependency Check
- npm audit
- dotnet list package --vulnerable in pipeline.

--slide---

## Lab: Check dependencies

Lab for running vulnerability check for dependencies

---page---

## Package locks

Why to lock packages and how to do it and how to generate bill of materials.

---page---

## License checks

How to check open source licenses used in project.

--slide---

## Lab: License check

Lab for checking what kinf of licenses are being used

---page---

## Static code analysis

How to scan code for vulnerabilities e.g. with CodeQL (or GitHub Advanced Security).

--slide---

## Lab: Static code analysis

Lab for scanning code for vulnerabilities.

---page---

## Secret scanning

E.g. how to use gitleaks to check for hard-coded password, api keys and such

--slide---

## Lab: Secret scanning

Scan secrets from the code

---page---

## Infrastructure as Code scanning

e.g. checkov

--slide---

## Lab: Scan IaC

Find vulnerabilities in IaC implementation before deployment

---page---

## Check HTTP headers

Use Mozilla Observatory to check the security posture of a website.

--slide---

## Lab: Scan website HTTP headers

Use Mozilla Observatory in GitHub actions to scan HTTP headers in a website.
