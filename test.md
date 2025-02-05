## Security safeguards in Continuous Integration

![Image](/img/kitchen.jpeg)

---slide---

Agenda:

- 0:00: Theory and lab introduction
- 0:10: Labs about GitHub Actions and dependencies
- 1:00: Check the lab solutions
- 1:05: Labs about development and infrastructure
- 2:00: Check the lab solutions
- 2:05: Labs about testing live target and next steps
- 2:45: Check the lab solutions
- 3:00: the end

Rinorragi & Co

---slide---

## Prerequisites

- GitHub account with public repository
- Text editor
- git

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
- Lab00: Teaches the syntax GitHub Actions syntax

---slide---

## Detect threats

```md [1|2|3]
🔴 Tool failed (bad)
🟢 Detect succesful (good)
🟢 Tool not run (bad)
```

---slide---

## Prevent threats

```md [1|2|3|4]
🔴 Prevention successful (good)
🔴 Tool failed (bad)
🟢 Tool not run (bad)
🟢 No threats (good)
```

---page---

## Dependencies

- These labs focus on different threats about software dependencies
- Lab10: Detect known vulnerabilities (SCA)
- Lab11: Learn to control how transient dependencies are resolved
- Lab12: Detect problematic licenses in dependencies
- Lab13: Generate Software Bill of Materials

---page---

## Development

- These labs focus on different threats during software development
- Lab20: Learn to protect important branches
- Lab21: Learn to find vulnerabilities in your code (SAST)
- Lab22: Learn to find secrets from git repositories

---page---

## Infrastructure

- Find vulnerabilities in your Infrastructure-as-Code
- Lab30: Scan GitHub Actions pipeline and terraform iac for vulnerabilities

---page---

## Testing live target

- These labs focus on running test against live target
- Lab40: Check security headers of an web application
- Lab41: Check TLS cipher suites of a web application
- Lab42: Run application in docker container and run tests against it (DAST)

---page---

## Next steps

- These labs are miscellanous advanced topics:
- Lab50: Learn how to generate your own static analysis results interchange format files
- Lab51: Learn how to use githooks to prevent bad pushes
- Lab52: Study defect dojo for application vulnerability management
- Lab53: Lean how to run GitHub Actions in your own machine
