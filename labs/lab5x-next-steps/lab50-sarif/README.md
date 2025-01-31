# Lab50 - Using OASIS Static Analysis Results Interchange Format (SARIF)

| Title          | Description                                                                                                |
| -------------- | ---------------------------------------------------------------------------------------------------------- |
| Target         | Learn how to generate SARIF to integrate your custom scripts to security tooling.                          |
| Difficulty     | Hard                                                                                                       |
| Measure        | Findings from custom tooling in similar manner as other findings                                           |
| Threat         | N/A as it is dependant on custom tooling                                                                   |
| Detect         | N/A as it is dependant on custom tooling                                                                   |
| Prevent        | N/A as it is dependant on custom tooling                                                                   |
| Stage          | N/A as it is dependant on custom tooling                                                                   |
| Known problems | Format is kind of complex. It also looks like that validator and GitHub don't exactly agree on the schema. |

OASIS SARIF is standard for common output format for static analysis tools. Understanding the format makes it easier to integrate your own scripts to tools GitHub for example supports SARIF out of the box and thus if you are able to produce SARIF from your custom scripts then you are able to easily integrate them to security tooling.

## Create custom SARIF file and integrate it to GitHub tooling

1. Check the [Lab9](/labs/lab09-http-header-scanning/README.md)
1. Take the output of the Mozilla Observatory
1. Transform it into SARIF format
1. Upload the SARIF JSON to GitHub
1. Check the results from `security/code scanning`

## Links

- OASIS SARIF: <https://www.oasis-open.org/committees/sarif/>
- GitHub SARIF support: <https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning>
- Microsoft SARIF tutorials: <https://github.com/microsoft/sarif-tutorials>
- SARIF Validator: <https://sarifweb.azurewebsites.net/Validation>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab11-sarif.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab11-sarif.yml>
- Script: <https://github.com/Rinorragi/ci-security/scripts/mozilla-observatory-sarif-generator.ps1>

<details>
  <summary>Spoiler warning - more info about solution</summary>

### About the task

Basically your task is to take json document and to format it into another format. Choosing the right tools for the task will help but of course you can do it by just string manipulation.

### Get example results

You might want to add following to IaC scan to upload working sarif report to start work with.

```
- name: Upload IaC scan results
  uses: actions/upload-artifact@master
  if: ${{ always() }}
  with:
    name: Checkov sarif
    path: results.sarif
```

### Cave Ats

In the example result message needs to be plaintext. If you just take wrong field from the original report and let it to be contaminated by HTML without encoding it will fail with unhelpful error messages.

</details>
