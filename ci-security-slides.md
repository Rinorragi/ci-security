## Security safeguards in Continuous Integration

Rinorragi & DrBushyTop

### Prerequisites

- GitHub account
- Text editor (or browser)
- git

---note---

Remember to reset the timer

---slide---

## DevSecOps master class

![Potato in kitchen](images/kitchen_potato.jpeg) <!-- .element: width="400" -->

- 18 labs
- ~10 minutes for each

---note---

Hope you stretched your fingers beforehand

---slide---

## Agenda

Agenda:

- 0:00: Theory and lab introduction
- 0:10: Labs: GitHub Actions and dependencies
- 1:00: Recap
- 1:05: Labs: development and infrastructure
- 2:00: Recap
- 2:05: Labs: testing live target and next steps
- 2:45: Recap
- 3:00: The end

---note---

You can continue anytime by your own time. Although we might change things.

---slide---

## Survival tips

- New to DevOps? ⇨ Focus on learning GitHub Actions
- Completionists ⇨ Start with answers from `release/examples` branch
- CTF ⇨ Just don't check the `release/examples` branch

---slide---

## How the labs work

- Fork the repository: <https://github.com/Rinorragi/ci-security>
- Read the `/labs/*`
- Make your own solution under `/.github/workflows`
- Check example solutions from <https://github.com/Rinorragi/ci-security/tree/release/examples>

---slide---

## Lab targets

- 99% of time you are targeting .NET application
- It is `dotnet new mvc` template with some small changes
- Disclaimer: Attack only targets that you have permission for.

---page---

## GitHub Actions

- GitHub Actions are based on YAML.
- 2000 minutes free time per month
- Run on "somebody elses VMs"
- Running on Windows / Mac images consumes more time
- Lab00-Lab02: Teaches the syntax GitHub Actions syntax

---slide---

```yaml [1-2|3-6|8-9|11-12]
name: Name shown in github
run-name: Run name shown in github
on: # Starting triggers
  workflow_dispatch: # Click from GitHub support
  pull_request: # After PR is created
  push: # After commit is pushed
jobs:
  Example-Job: # Set of steps that are run on a VM
    runs-on: ubuntu-latest # type of vm
    steps:
      - name: Example # name of step
        run: echo "🎉!" # Actually doing the thing
```

---slide---

## Detect threats

```md [1|2|3|4]
🟢 Detect succesful (good)
🟢 Tool not run (bad)
🔴 Tool failed (bad)
🔴 Detected and failed (bad)
```

---note---

If the point is to detect and not prevent, then build failures are soon to be dismissed if they by default always fail.

---slide---

## Prevent threats

```md [1|2|3|4]
🟢 No threats (good)
🔴 Prevention successful (good)
🔴 Tool failed (bad)
🟢 Tool not run (bad)
```

---note---

False positive, false negative, true positive, true negative etc.

---slide---

## Recap

- [Lab00: Hello](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab00-hello-github-actions.yml)
- [Lab01: Variables and secrets](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab01-variables-and-secrets.yml)
- [Lab02: Reuse and artifacts](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab02-reuse-and-artifacts.yml)

---note---

- Lab00: Just print something
- Lab01: Check variable printing and masking of data
- Lab02: Check publish artifact part and output

---page---

## Dependencies

![Pointing potato](images/pointing_potato.jpeg) <!-- .element: width="400" -->

---note---

Somebody elses fault

---slide---

### These labs focus on different threats about software dependencies

- Lab10: Detect known vulnerabilities (SCA)
- Lab11: Learn to control how transient dependencies are resolved
- Lab12: Detect problematic licenses in dependencies
- Lab13: Generate Software Bill of Materials

---slide---

## Recap

- [Lab10: SCA](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab10-software-composition-analysis.yml)
- [Lab11: Package locks](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab11-create-package-lock.yml)
- [Lab12: License check](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab12-license-check.yml)
- [Lab13: SBOM](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab13-sbom.yml)

---note---

- Lab10: System.Text.Json vuln and jquery vuln
- Lab11: Nothing fancy, transient dependencies are just resolved awkwardly. Dotnet by default resolves lowest possible version of a package ... which is awkward.
- Lab12: AGPL and also that scancode actually scans your files, not just the metadata
- Lab13: Nothing special, just check the output

---page---

## Development

![Sad potato](images/sad_potato.jpeg) <!-- .element: width="400" -->

---slide---

### These labs focus on different threats during software development

- Lab20: Learn to protect important branches
- Lab21: Learn to find vulnerabilities in your code (SAST)
- Lab22: Learn to find secrets from git repositories

---slide---

## Recap

- [Lab20: Branch protections](https://github.com/Rinorragi/ci-security/blob/release/examples/scripts/branchprotections.ps1)
- [Lab21: SAST](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab21-static-application-security-testing.yml)
- [Lab22: Secret scanning](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab22-secret-scanning.yml)

---note---

- Lab20: Show the github protections
- Lab21: Semgrep finds jquery, dockerfile and rce. GHAS does not find anything. Except in PR GHAS founds XSS and OpenRedirect too.
- Lab22: E.g. vulnerable pipeline hardcoded secrets where not found. Trufflehog and gitleaks found azure storage key.

---page---

## Infrastructure

![Builder potato](images/builder_potato.jpeg) <!-- .element: width="400" -->

---slide---

### Find vulnerabilities in your Infrastructure-as-Code

- Lab30: Scan GitHub Actions pipeline and terraform iac for vulnerabilities

---slide---

## Recap

- [Lab30: IaC scanning](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab30-infrastructure-as-code-scanning.yml)

---note---

- Lab30: Show both output and security tab

---page---

## Testing live target

![Conjuring potato](images/conjuring_potato.jpeg) <!-- .element: width="400" -->

---slide---

### These labs focus on running test against live target

- Lab40: Check security headers of an web application
- Lab41: Check TLS cipher suites of a web application
- Lab42: Run application in docker container and run tests against it (DAST)

---slide---

## Recap

- [Lab40: Header scanning](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab40-http-header-scanning.yml)
- [Lab41: TLS scanning](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab41-tls-scanning.yml)
- [Lab42: DAST](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab42-dast.yml)

---note---

- Lab40: Needs public target. Show output.
- Lab41: Show the results. Also remind that it matters from which machine and how this is done. (nmap results wary)
- Lab42: Show nuclei, zap and ffuf results. Should find postinfo.html from ffuf.

---page---

## Next steps

![Professor potato](images/professor_potato.jpeg) <!-- .element: width="400" -->

- These labs are miscellanous advanced topics:
- Lab50: Learn how to generate your own static analysis results interchange format files
- Lab51: Learn how to use githooks to prevent bad pushes
- Lab52: Study defect dojo for application vulnerability management
- Lab53: Lean how to run GitHub Actions in your own machine

---slide---

## Recap

- [Lab50: SARIF](https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab50-sarif.yml)

---note---

- Lab50: Show how it integrates with github
- Lab51: Show an example how in given branch commit is blocked with commit msg being wrong
- Lab52: ???
- Lab53: Show how act works in your machine
