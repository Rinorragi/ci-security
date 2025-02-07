# Lab05 - License check

| Title          | Description                                                                                              |
| -------------- | -------------------------------------------------------------------------------------------------------- |
| Target         | Learn to detect problematic software licenses in your dependencies                                       |
| Difficulty     | Hard                                                                                                     |
| Measure        | Amount of different licenses you are dependant upon                                                      |
| Threat         | You violate license agreement and would have legal consequences because of that                          |
| Detect         | Licenses that are being used                                                                             |
| Prevent        | Using dependencies that have licenses that are unaccetable for your use case                             |
| Stage          | Build                                                                                                    |
| Known problems | Your direct dependencies might have different license than files and dependencies that is dependant upon |

Managing open-source licenses is a critical part of software governance and compliance. In this lab, you’ll detect all licenses used by your project and fail the build if anything other than MIT is discovered — while also learning to make exceptions where necessary. Tools like `Scancode`, `dotnet delice`, and `NPM license checker` can help automate license scanning across different ecosystems, ensuring you maintain visibility and control over your dependencies’ legal requirements.

## Find used licenses and fail on unknowns

Check the licenses used in project and fail if there is something else than MIT and then learn to make exceptions.

## Links

- Scancode: <https://aboutcode.org/scancode/>
- Scancode CLI: <https://scancode-toolkit.readthedocs.io/en/latest/cli-reference/simple-examples.html#running-the-scan>
- Scancode GitHub Action: <https://github.com/aboutcode-org/scancode-action>
- Dotnet delice: <https://github.com/aaronpowell/dotnet-delice>
- Abandoned license project: <https://github.com/tomchavakis/nuget-license>
- Rewrite of abandoned license project: <https://github.com/sensslen/nuget-license>
- NPM license checker: <https://www.npmjs.com/package/license-checker>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab12-create-package-lock.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab12-create-package-lock.yml>

<details>
  <summary>Spoiler warning - more info about solution</summary>
  
### .NET licenses

.NET does not natively provide you information from license about packages with `dotnet list package --include-transitive` which is really unfortunate. But you can achieve it natively with few different ways.

#### Local option

1. Use `dotnet nuget locals -l global-packages` to find where Nugets are being stored
1. Match your packages with that folder and lowercase package id with correct version and the right .nuspec file.
1. Grab the license information from nuspec file

#### Online option

1. Match your packages with NuGet API with following syntax `https://api.nuget.org/v3-flatcontainer/<package id>/<package version>/<package id>.nuspec` e.g. `https://api.nuget.org/v3-flatcontainer/system.text.json/9.0.0/system.text.json.nuspec`
1. Grab the license field from json

</details>
