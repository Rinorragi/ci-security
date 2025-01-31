# Lab10 - Software Composition Analysis (SCA)

| Title          | Description                                                                                                              |
| -------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Target         | Learn to find known vulnerabilities from dependencies                                                                    |
| Difficulty     | Medium                                                                                                                   |
| Measure        | Amount of vulnerabilities                                                                                                |
| Threat         | [OWASP TOP 10: Vulnerable and outdated components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/) |
| Detect         | Known vulnerabilities that attacker could use to attack application                                                      |
| Prevent        | Deploying vulnerable application                                                                                         |
| Stage          | Build (prevent new vulnerabilities from dependency changes), Daily (Find information about new vulnerabilities)          |
| Known problems | Not all ecosystems publish vulnerability information equally and not all vulnerabilities get public CVE numbers          |

Software Composition Analysis (SCA) helps detect known vulnerabilities in the open-source libraries and frameworks used by your application. By scanning direct and transitive dependencies, SCA tools highlight security flaws and outdated packages, so you can take action before issues affect your production environment.

Because these tools often rely on different vulnerability databases or specialize in particular ecosystems, it’s beneficial to run multiple checks. This is often done in the Build stage of your CI/CD pipeline, and run during PR checks, ensuring that every commit is scanned for potential risks.

In this lab, you’ll use various SCA approaches — such as `OWASP Dependency Check`, .NET’s built-in commands, `RetireJS`, and `NPM audit` — to discover which best fits your workflow and provides the most comprehensive coverage.

## TODO

Fix or remove Test-with-dependency-review

## Find vulnerabilities from dependencies

Try to find vulnerabilities in the example apps. There are multiple ways to do it but I would suggest starting from OWASP Dependency Check because it is most versatile. Finding vulnerabilities is in theory straightforward but tricky thing is that different tools might host their own vulnerability database or solely focus on one tech stack.

## Links

- Dependendency review: <https://github.com/actions/dependency-review-action>
- Dependabot: <https://docs.github.com/en/code-security/getting-started/dependabot-quickstart-guide>
- How to write warnings and errors in GitHub workflows: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#setting-a-warning-message>
- Toolkit functions for easier failure: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#using-workflow-commands-to-access-toolkit-functions>
- GitHub Action for OWASP Dependency Check: <https://github.com/dependency-check/Dependency-Check_Action>
- Dotnet native way to find vulns: <https://learn.microsoft.com/en-us/nuget/concepts/auditing-packages#dotnet-list-package---vulnerable>
- RetireJS to find JS vulns: <https://github.com/RetireJS/retire.js/tree/master/node>
- NPM audit to find vulns in Node projects: <https://docs.npmjs.com/cli/v9/commands/npm-audit>

## Example solution

It is better to try by yourself first, but when you are done with that here is a solution for the task

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab10-software-composition-analysis.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab10-software-composition-analysis.yml>

<details>
  <summary>Spoiler warning - more info about solution</summary>
  
### OWASP Dependency Check

It creates a nice HTML report which finds the NuGet and JS vulnerabilities hidden in the solution.

### dotnet list package --vulnerable --include-transitive

Requires a bit of ducktape around to make it suitable for build pipelines. Although it is very convenient way to test when you are building e.g. .NET API. Even when the dotnet application is build purely from .NET template it does not find the JS vulnerabilities which came with the template.

### RetireJS

Has multiple ouput options and fits nicely to build pipeline. Although it naturally misses the NuGet vulnerabilities and only reports the JS ones.

### Dependabot

Dependabot has also noticed need for updates that can be found from: <https://github.com/Rinorragi/ci-security/pulls>

</details>
