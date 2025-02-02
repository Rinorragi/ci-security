# ci-security

Welcome to the ci-security repository! These labs are designed to teach you how to add basic security safeguards to your CI pipeline using GitHub Actions.

- Code: <https://github.com/Rinorragi/ci-security>
- Slides: <https://rinorragi.github.io/ci-security/>

## Disclaimer

Obey the law. Don't attack targets that you don't have permission. Don't abuse the good will of those who let us use [GitHub hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners). Cryptomining was already a problem few years back. Abusive usage will eventually hurt community in restrictions of runner usage.

## Prerequisites

Before diving in, make sure you have the following:

1. **A free GitHub account**

   - This includes free Actions minutes for building and testing the labs.

2. **Git installed locally**

   - You’ll need Git to clone and commit changes to your forked repository.

3. **A text editor or IDE of your choice**
   - Any editor is fine; choose what you’re most comfortable using.

4. **OPTIONAL: Github Actions extension for your IDE**
   - This will provides some reasonable syntax highlighting and autocompletion for GitHub Actions workflows.
   - Some options: [VSCode](https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions), [JetBrains](https://plugins.jetbrains.com/plugin/21396-github-workflow).

## Getting Started

1. **Fork the Repository**

   - Click `Fork` at the top-right corner of this GitHub repo to create your own copy under your personal GitHub account.

2. **Clone Your Fork**

   - Use `git clone` on your local machine to download your newly forked repository (e.g., `git clone https://github.com/<your-username>/ci-security.git`).

3. **Explore the Labs**

   - Each lab covers a different security topic and resides within the `labs` folder. You’ll be using GitHub Actions to automate tasks, and the build minutes required for these labs are included with your free GitHub account.

4. **Check the Solutions**
   - If you get stuck, refer to the lab-specific README files or the workflows in `.github/workflows` for a hint or a complete solution.

## Working with the repository

Normal development pattern of GitHub Actions is:

1. Make local changes to your code
2. git commit & git push
3. Run the workflow and hope for the best
4. Goto 1 (until you are satisfied)

To be able to run any version of GitHub action you need to have the `yml` file in the `default` (main) branch. After that you can choose to run different versions of that pipeline from selected branch.

If you want to jump into deep water you could try running them locally [at your workstation](/labs/lab5x-next-steps/lab53-act/README.md).

## Apps

Apps are pretty boring.

- [uptodate-app](https://github.com/Rinorragi/ci-security/tree/main/apps/uptodate-app) is just plain empty template done with `dotnet new mvc`
- [vulnerable-app](https://github.com/Rinorragi/ci-security/tree/main/apps/vulnerable-app) is similarly done with `dotnet new mvc` but there are some vulns added for you to find with the labs

## Labs

- [Lab00 - Hello GitHub Actions](/labs/lab0x-hello-github-actions/lab00-hello-github-actions/README.md)
- [Lab10 - Software Composition Analysis](/labs/lab1x-dependencies/lab10-sca/README.md)
- [Lab11 - Package locks](/labs/lab1x-dependencies/lab11-package-locks/README.md)
- [Lab12 - License check](/labs/lab1x-dependencies/lab12-license-check/README.md)
- [Lab13 - Software Bill of Materials](/labs/lab1x-dependencies/lab13-sbom/README.md)
- [Lab20 - Branch protections](/labs/lab2x-development/lab20-branch-protections/README.md)
- [Lab21 - Static Application Security Testing](/labs/lab2x-development/lab21-sast/README.md)
- [Lab22 - Secret scanning (contains TODO)](/labs/lab2x-development/lab22-secret-scanning/README.md)
- [Lab30 - IaC scanning](/labs/lab3x-infrastructure/lab30-iac-scanning/README.md)
- [Lab40 - HTTP header scanning](/labs/lab4x-testing-live-target/lab40-http-header-scanning/README.md)
- [Lab41 - TLS cipher scanning](/labs/lab4x-testing-live-target/lab41-tls-scanning/README.md)
- [Lab42 - Dynamic Application Security Testing](/labs/lab4x-testing-live-target/lab42-dast/README.md)
- [Lab50 - SARIF file generation](/labs/lab5x-next-steps/lab50-sarif/README.md)
- [Lab51 - githooks (contains TODO)](/labs/lab5x-next-steps/lab51-githooks/README.md)
- [Lab52 - Defect Dojo (contains TODO)](/labs/lab5x-next-steps/lab52-defect-dojo/README.md)
- [Lab53 - nektos/act (contains TODO)](/labs/lab5x-next-steps/lab53-act/README.md)

## Tools Used

Throughout these labs, you’ll encounter various security and automation tools. None of these are endorsed by default; they are simply examples chosen for their ease of setup and community support. Feel free to swap in other tools that fit your organization’s needs.

[Check here for the preinstalled components of GitHub runners](https://github.com/actions/runner-images).
