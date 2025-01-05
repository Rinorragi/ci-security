# Lab06 - Static Application Security Testing (SAST)

Static Application Security Testing (SAST) inspects your source code (or compiled artifacts) for potential security flaws before the application is ever run. By scanning for dangerous patterns, insecure functions, or known vulnerabilities, SAST tools like GitHub Advanced Security and Semgrep can catch issues early in development. In this lab, you’ll set up a SAST workflow for the `vulnerable-app`, ensuring that security checks happen automatically on each commit.

There are ton of SAST tools and you should choose your weapons based on the technology stack (programming languages) and use cases. Best tools might require licenses and setting up servers or whatnots.

## Find vulnerabilities in the code of vulnerable-app with SAST

GitHub Advanced Security and Semgrep Community Edition are something that you could look first.

## Links

- Semgrep (Community Edition): <https://semgrep.dev/docs/semgrep-ci/sample-ci-configs#sample-github-actions-configuration-file>
- Semgrep rules: <https://github.com/semgrep/semgrep-rules>
- GitHub Advanced Security: <https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/main/.github/workflows/lab06-static-application-security-testing.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab06-static-application-security-testing.yml>
