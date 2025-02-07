# Lab13 - Generate Software Bill of Materials (SBOM)

| Title          | Description                                                                                                                                                                                                                                                                                                                                                               |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Target         | Learn to generate Software Bill of Materials                                                                                                                                                                                                                                                                                                                              |
| Difficulty     | Medium                                                                                                                                                                                                                                                                                                                                                                    |
| Measure        | Components used in application                                                                                                                                                                                                                                                                                                                                            |
| Threat         | [OWASP TOP 10: Vulnerable and outdated components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/). Sometimes there are no CVEs or updates to vulnerabilities but you can read about them from media. This would create you a catalog where to check if you are using something. It can be also implemented in centralized manner for organization. |
| Detect         | Used components                                                                                                                                                                                                                                                                                                                                                           |
| Prevent        | N/A                                                                                                                                                                                                                                                                                                                                                                       |
| Stage          | Build                                                                                                                                                                                                                                                                                                                                                                     |
| Known problems | Generating SBOM is the first step. You need to have a place where to upload them and from where to browse them.                                                                                                                                                                                                                                                           |

Software Bill of Materials (SBOM) is one of the things that might be mandatory if you are working with USA based companies or government. Its purpose is to understand what all is included into supply chain of a solution. This might not be that useful unless there is centralized place to upload them. If there is centralized place you could check from there for example in case of new Log4Shell that which applications are using that component and then contact the system owners about urgent need for patching even if they would not have Software Composition Analysis or similar in place.

There seems to be two formats that are often used: SPDX and CycloneDX. Based on my experience CycloneDX would be preferred choice for me but I have not much to back my claim.

## Generate SBOM

Generate SBOM from the vulnerable-app familiar from earlier exercises in CI pipeline.

## Links

- [SPDX format](https://spdx.dev/learn/overview/)
- [CycloneDX format](https://github.com/CycloneDX/specification)
- [sbom-tool](https://github.com/microsoft/sbom-tool)
- [CycloneDX](https://github.com/CycloneDX/cyclonedx-dotnet)

## Solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab13-sbom.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab13-sbom.yml>
