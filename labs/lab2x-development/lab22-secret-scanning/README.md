# Lab22 - Secret scanning

| Title          | Description                                                                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Target         | Learn how to detect and prevent leaking secrets                                                                                                                       |
| Difficulty     | Medium                                                                                                                                                                |
| Measure        | Amount of leaked secrets                                                                                                                                              |
| Threat         | [One version of OWASP TOP 10: Cryptographic failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/). Publishing secrets to version control as clear text. |
| Detect         | Leaked secrets                                                                                                                                                        |
| Prevent        | Leaking secrets                                                                                                                                                       |
| Stage          | Commit / Build                                                                                                                                                        |
| Known problems | GitHub Advanced Security prevents automatically certain format of secrets being leaked. But not all. Other tools have similar weaknesses.                             |

Secret scanning detects credentials and other sensitive information that may be accidentally stored in source code or configuration files. Tools like `Trufflehog`, `Gitleaks`, and `GitGuardian` can be integrated into your CI pipeline to automatically flag any discovered secrets. Some tools provide additional features, like preventing secrets from being pushed to the repository, whereas others only scan for secrets without taking action.

In this lab, you’ll configure secret scanning tools to identify and protect against accidental exposure of secrets in the codebase.

## TODO

Try to add something to find.

## Find secrets from the solution with secret scanning tools

`GitHub Advanced Security` already scans secrets from public repositories. But it has its limitations.

## Links

- Trufflehog: <https://github.com/marketplace/actions/trufflehog-oss>
- gitleaks: <https://github.com/gitleaks/gitleaks>
- GitGuardian (requires Free plan): <https://docs.gitguardian.com/ggshield-docs/integrations/cicd-integrations/github-actions>
- GitHub Advanced Security: <https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab07-secret-scanning.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab07-secret-scanning.yml>
