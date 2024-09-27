# Security safeguards in Continuous Integration

Rinorragi & Co


## Prerequisites

- GitHub account with public repository
- Text editor
- git



## GitHub Actions


## Lab: GitHub Actions

Lab for creating Hello GitHub Actions



## Branch protections

Something about the importance of pull request approvals and protected branches


## Lab: Branch protections

Lab for setting up branch protections



## Check dependencies

Why to check dependencies
How to run one or more of the following in ci

- OWASP Dependency Check
- npm audit
- dotnet list package --vulnerable in pipeline.


## Lab: Check dependencies

Lab for running vulnerability check for dependencies



## Package locks

Why to lock packages and how to do it and how to generate bill of materials.



## License checks

How to check open source licenses used in project.


## Lab: License check

Lab for checking what kinf of licenses are being used



## Static code analysis

How to scan code for vulnerabilities e.g. with CodeQL (or GitHub Advanced Security). 


## Lab: Static code analysis

Lab for scanning code for vulnerabilities.



## Secret scanning

E.g. how to use gitleaks to check for hard-coded password, api keys and such


## Lab: Secret scanning

Scan secrets from the code



## Infrastructure as Code scanning

e.g. checkov


## Lab: Scan IaC

Find vulnerabilities in IaC implementation before deployment



## Check HTTP headers

Use Mozilla Observatory to check the security posture of a website.


## Lab: Scan website HTTP headers

Use Mozilla Observatory in GitHub actions to scan HTTP headers in a website.