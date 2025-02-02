# Lab53 - ACT

| Title          | Description                                                                                        |
| -------------- | -------------------------------------------------------------------------------------------------- |
| Target         | Read about how to run GitHub actions in your own machine                                           |
| Difficulty     | Hard                                                                                               |
| Measure        | Development velocity                                                                               |
| Threat         | Your development process has waste of time because of having deal with the remote git repository   |
| Detect         | Problems in GitHub Actions workflows earlier                                                       |
| Prevent        | Broken workflow code getting into remote repository                                                |
| Stage          | Build                                                                                              |
| Known problems | You are advised to build your own GitHub runner images. Docker jobs inside docker might be tricky. |

Learn how to use [nektos/act](https://github.com/nektos/act) and run pipelines locally. This removes the need of commit+push every change to test the actual pipelines which might sometimes save you a lot of time.

## Run 0x jobs in your own machine

1. [Install Act](https://nektosact.com/installation/index.html)
1. [Pull the runner images or build your own](https://nektosact.com/usage/runners.html)
1. [Run either 0x workflows or jobs with act](https://nektosact.com/usage/index.html#workflows)

## Links

- [nektos/act](https://github.com/nektos/act)
- [github runner images](https://github.com/actions/runner-images)

## Example solution

<details>
  <summary>Spoiler warning - more info about solution</summary>

You will likely face additional difficulties at `4x` labs when you try to run docker inside docker. Nevertheless what could work is something like following. This requires you to have docker already setup in wsl (or whatever is your weapon of choice).

```bash
# Install to WSL to directory where you are
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
# List jobs
./bin/act -l
# Pull the docker images that act uses (e.g. following)
docker pull catthehacker/ubuntu:full-latest
# Configure to have pipeline artifacts somewhere you can access them
nano /home/whoyouare/.config/act/actrc
# Add line (e.g.)
--artifact-server-path /home/whoyouare/act-artifacts
# Run for example job named cyclonedx
./bin/act -j cyclonedx
```

</details>
