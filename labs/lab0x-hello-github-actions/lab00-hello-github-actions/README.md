# Lab00 - Hello GitHub Actions

| Title          | Description                           |
| -------------- | ------------------------------------- |
| Target         | Learn basics of GitHub Actions syntax |
| Difficulty     | Easy                                  |
| Measure        | Build succeeds                        |
| Threat         | N/A                                   |
| Detect         | N/A                                   |
| Prevent        | N/A                                   |
| Stage          | N/A                                   |
| Known problems | N/A                                   |

GitHub Actions is a powerful CI/CD platform that lets you automate tasks directly from your GitHub repository.

## TODO

More examples and tasks

## Build Pipeline Overview

A build pipeline is a sequence of automated steps that compile, package, and test your code. By running these steps consistently and automatically (for example, on every pull request), you gain confidence that the code is functional and meets quality standards before merging changes.

### Splitting Build and Release

It’s common practice to keep **build** and **release** steps separate. During the **build** phase, you typically compile the code, run tests, and produce artifacts (e.g., binaries or container images). These artifacts are then stored (uploaded) and later downloaded for the **release** phase, where the final deployment or publishing occurs. This separation allows you to:

- **Run Automated Checks** on pull requests or feature branches without triggering a full release.
- **Decouple Build and Deploy** to ensure that only tested and approved code is released.
- **Maintain Reproducibility** by building once and deploying the exact same artifacts.
- **Scale Teams** by letting different roles (e.g., developers vs. release managers) work on their respective parts without interference.

### Workshop Focus

The labs in this workshop primarily focus on the **build** phase of the CI/CD process. You’ll learn to incorporate various security checks into your build pipelines, ensuring issues are caught early and automatically, well before code moves on to release and production.

In this lab, you’ll start from the basics and set up a simple workflow to print text as a “Hello World” introduction. This first step will help you understand how GitHub Actions works, laying the groundwork for more complex automations later in the workshop.

## Run a simple GitHub action

Try to print text with GitHub actions!

## Links

- Understanding GitHub Actions: <https://docs.github.com/en/actions/about-github-actions/understanding-github-actions>
- Quickstart how to write GitHub Actions pipelines: <https://docs.github.com/en/actions/writing-workflows/quickstart>
- Workflow syntax: <https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions>
- Workflow commands: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions>
- Expressions: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/evaluate-expressions-in-workflows-and-actions>
- Variables: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/store-information-in-variables>
- Contexts: <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs>

## Example solution

It is better to try by yourself first, but when you are done with that here is a solution for the task

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab00-hello-github-actions.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab00-hello-github-actions.yml>
