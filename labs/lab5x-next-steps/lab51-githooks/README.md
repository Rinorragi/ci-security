# Lab51 - Use githooks to force security checks precommit

| Title          | Description                                                                                                                                                                                                                                  |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Target         | Learn how to use githooks to give earlier response about security for developers                                                                                                                                                             |
| Difficulty     | Hard                                                                                                                                                                                                                                         |
| Measure        | Time that precommit hooks take                                                                                                                                                                                                               |
| Threat         | Developers got irritated because they get feedback of security checks only from build pipeline.                                                                                                                                              |
| Detect         | Basically any build time problem but earlier.                                                                                                                                                                                                |
| Prevent        | Committing insecure code to local branch. Pushing insecure code to remote repository.                                                                                                                                                        |
| Stage          | Git push (Build time problems)                                                                                                                                                                                                               |
| Known problems | Githooks are not shared by default, so you need to agree on configuring githooks to different folder. This make it eventually only "opt-in" type of security check. Sharing them opens RCE vector to your machine that you need to consider. |

Githooks are yet another way to get something integrated into part of development scenarios. There are two types of githooks:

1. Those that happens in the remote server (GitHub does not support them as far I know). GitHub Actions are used to do those CI checks instead
2. Those that happens in the client

We are interested this solely because in some scenarios this enables giving feedback closer to developer in a "opt-in" way. The drawback is that it requires careful planning so that it won't disturb the normal flow of working. If you are planning to use githooks for something then make sure that they are fast.

Normal scenario that I would have used githooks would be to enforce certain kind of commit message format to ensure trackability between code and ticketing system that is used to track the progress (e.g. Jira). That would be fast and useful. But in some cases I have also agreed with team to have certain kind of testing done in prior of pushing or committing to ensure higher quality of commits in the first place. This might not always fit in for the development flow.

There is also downside of githooks. They are basically RCE vector to your machine. So if you would configure githooks to different folder than what is not normally exposed then you need to trust all the people who can commit to that folder.

## Implement githook

1. Implement githook to list files that were changed in the commit process that could be feeded for secret scanning or static code analysis tool
1. Implement githook to ensure commit message format
1. Come up with the solution how to share githooks with other colleagues

By default hooks are in `$GIT_DIR/hooks` and they pretty much support only bash script. If you want to run e.g. powershell then you need to have a wrapper bash script that feeds the parameters for the powershell which would be totally unneccessary if you are confident with bash.

You also want to ensure that end-of-line is LF. You might need to change `.editorconfig`. You might need to also add `.gitattributes` and config everything else to have eol=crlf but the hooks directory to have eol=lf.

You can also check the git hooks templates that are autopopulated by just `ls /.git/hooks`.

## Links

- [githooks](https://git-scm.com/docs/githooks)
- [customizing githooks](https://git-scm.com/book/ms/v2/Customizing-Git-Git-Hooks)

## Solution

<details>
  <summary>Spoiler warning - more info about solution</summary>

### Example to configure githooks

1. Create folder `.githooks`.
1. Share script that runs `git config core.hooksPath .githooks`
1. Developer may opt-in into having local githooks by running that script
1. If you create advance scripts you can provide configuration file that is gitignored that could choose which hooks are being run.

Or another way

1. Create the wanted githooks as a templates into any folder in a solution
1. Make a script that copy them under the `$GIT_DIR/hooks`

### Example details

- [Configure githooks](https://github.com/Rinorragi/ci-security/blob/release/examples/configure-githooks.ps1)
- [Uncofigure githooks](https://github.com/Rinorragi/ci-security/blob/release/examples/unconfigure-githooks.ps1)
- [Editorconfig changes](https://github.com/Rinorragi/ci-security/blob/release/examples/.editorconfig#L18-L20)
- [githooks bash wrappers](https://github.com/Rinorragi/ci-security/tree/release/examples/.githooks)
- [githook pwsh implementations](https://github.com/Rinorragi/ci-security/tree/release/examples/scripts/githooks)

</details>
