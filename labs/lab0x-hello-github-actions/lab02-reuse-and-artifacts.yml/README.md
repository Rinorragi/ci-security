# Lab02 - Reuse and Artifacts

| Title          | Description                                              |
| -------------- | -------------------------------------------------------- |
| Target         | Learn how to use Composite Actions and publish artifacts |
| Difficulty     | Medium                                                   |
| Measure        | Build succeeds                                           |
| Threat         | N/A                                                      |
| Detect         | N/A                                                      |
| Prevent        | N/A                                                      |
| Stage          | Build, Deploy                                            |
| Known problems | N/A                                                      |

GitHub Actions allows you to reuse common logic or complete workflows across multiple repositories by creating **Composite Actions** or **Reusable Workflows**. This helps you maintain consistency and reduce duplication of code across your projects and environments.

[This table](https://docs.github.com/en/actions/sharing-automations/avoiding-duplication#key-differences-between-reusable-workflows-and-composite-actions) shows the difference between Composite Actions and Reusable Workflows and helps you decide which one to use for your use case.

Another important aspect for build pipelines is the ability to share artifacts between jobs or workflows. Artifacts are files that are produced by a job and uploaded to GitHub for later use. You can think of them as a versioned package that can be downloaded and reused. For example, you might want to deploy the same binary to multiple environments or run additional tests on the same build output.

In this lab, you will learn how to call on existing Composite Actions and Reusable Workflows, and how to publish artifacts from your build pipeline to be used by later jobs or workflows.

## Reuse Existing Actions and Workflows

- Call the existing Composite Action from path [.github/actions/build-dotnet-app](../../../.github/actions/build-dotnet-app/action.yml). You can use the [apps/uptodate-app](../../../apps/uptodate-app/) path as the `folder-path` input parameter for the action.
- In a separate job, use the existing [greeter.yml](../../../.github/workflows/greeter.yml) workflow from the [`.github/workflows`](../../../.github/workflows/) folder.

## Publish artifacts

Use the `actions/upload-artifact@v4` action to publish the binary produced by `.github/actions/build-dotnet-app` as an artifact based on the `outputs` of the Composite Action.

## Links

- [Reusing Workflows](https://docs.github.com/en/actions/sharing-automations/reusing-workflows)
- [Composite Actions](https://docs.github.com/en/actions/creating-actions/creating-a-composite-run-steps-action)
- [Output for Composite Actions & Other metadata syntax](https://docs.github.com/en/actions/sharing-automations/creating-actions/metadata-syntax-for-github-actions#outputs-for-composite-actions)
- [Artifacts](https://docs.github.com/en/actions/guides/storing-workflow-data-as-artifacts)
  - [Upload Artifact Action](https://github.com/actions/upload-artifact)
  - [Download Artifact Action](https://github.com/actions/download-artifact)

## Example solution

It is better to try by yourself first, but when you are done with that here is a solution for the task

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab02-reuse-and-artifacts.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab02-reuse-and-artifacts.yml>
