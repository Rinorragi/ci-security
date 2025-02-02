# Lab01 - Variables and Secrets

| Title          | Description                                         |
| -------------- | --------------------------------------------------- |
| Target         | Learn how to use variables and secrets in pipelines |
| Difficulty     | Easy                                                |
| Measure        | Build succeeds                                      |
| Threat         | N/A                                                 |
| Detect         | N/A                                                 |
| Prevent        | N/A                                                 |
| Stage          | N/A                                                 |
| Known problems | N/A                                                 |

GitHub Actions offers a robust way to manage both configuration and security through Variables and Secrets. Variables let you define reusable configuration values across your workflows, making it easier to maintain and update your automation scripts. Secrets, on the other hand, enable you to securely store sensitive information—such as API keys or passwords—and ensure they remain hidden in your logs.

In this lab, you will build a simple workflow that demonstrates how to use both environment variables and repository secrets. You’ll learn how to:

- Define and Use Variables: Set variables at the job level and reference them in your steps, simplifying your workflow configuration.
- Access and Mask Secrets: Pull sensitive data from your repository’s secret store and see how GitHub Actions automatically masks these values in the log output, keeping your sensitive data secure.

By the end of this lab, you’ll have a clear understanding of how to leverage these features to create secure and maintainable GitHub Actions workflows.

## Configure variables and Secrets

Define a variable `MY_VARIABLE` with the value `Hello, GitHub Actions!` that is accessible in all steps of the workflow.

Define a repository level secret `DEMO_SECRET` with the value of your choosing.

## Print out the variables and secrets to understand log obfuscation

Print out the values of `MY_VARIABLE` and `DEMO_SECRET` in the workflow to see how GitHub Actions obfuscates the secret value in the logs.

## Links

- [Store information in Variables](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/store-information-in-variables)
- [Using Secrets in GitHub Actions](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions)
- [Security Hardening for Secrets](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions#using-secrets)

## Example solution

It is better to try by yourself first, but when you are done with that here is a solution for the task

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab01-variables-and-secrets.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab01-variables-and-secrets.yml>
