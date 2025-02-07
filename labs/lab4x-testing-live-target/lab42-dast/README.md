# Lab42 - Dynamic Application Security Testing (DAST)

| Title          | Description                                                                                                                                                                                                              |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Target         | Use spidering and web application vulnerability scanning to find security weaknesses in application                                                                                                                      |
| Difficulty     | Hard                                                                                                                                                                                                                     |
| Measure        | Amount of findings                                                                                                                                                                                                       |
| Threat         | [OWASP TOP 10](https://www.zaproxy.org/docs/guides/zapping-the-top-10-2021/)                                                                                                                                             |
| Detect         | Vulnerabilities in web application                                                                                                                                                                                       |
| Prevent        | Vulnerabilities in web application                                                                                                                                                                                       |
| Stage          | Deploy                                                                                                                                                                                                                   |
| Known problems | You need live target and sometimes it is not public. So you might need an agent inside your network to do this. These tools tend to provide lots of information so you might need to come up with whitelisting solution. |

Dynamic Application Security Testing (DAST) means that your application is up and running and you use web application vulnerability scanner to find vulnerabilities on that. This is often done as a part of penetration test assignment as a half-manual half-automatic exercise. Typical tools for this kind of half-manual task is Burp Suite and Zed Attack Proxy. Nuclei would be good option in CI/CD pipeline. DAST often tries to identify known issues in web application like XSS with certain payloads to form fields.

Fuzz testing is close to DAST. Difference is that Fuzz testing tries to find conditions that will trigger anomalities in response. This can take tremendous amount of time depending of usage. Still it is similar to DAST and you can use for example ffuf in trying to scrape certain kind of answers from responses or by shooting list of different known attacks against an endpoint.

## Implement Dynamic Application Security Testing in Continuous integration

1. Use docker to run application in CI pipeline (example below)
1. Run web application vulnerability scanner against the target
1. Upload results
1. Fail the build if there are vulnerabilities

```powershell
  docker build -t vulnerable-app-image -f /apps/vulnerable-app/Dockerfile .
  docker run -t -d vulnerable-app-image -p 8080:8080
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' 7d3ddbd4b99f
```

This exercise will be hard since running docker happens in one step and you can't use readymade GitHub Actions to target that but you need to make it all happen in one step. (or that was my experience)

You can check the [vulnerable-pipeline](/.github/workflows/vulnerable-pipeline.yml) to see how to run the application in a docker.

## Links

- [Nuclei Docker](https://projectdiscovery.io/blog/how-to-run-nuclei-other-projectdiscovery-tools-in-docker)
- [Nuclei Github Action](https://github.com/projectdiscovery/nuclei-action)
- [Zed Attack Proxy Docker](https://www.zaproxy.org/docs/docker/about/)
- [Zed Attack Proxy GitHub Action](https://github.com/marketplace/actions/zap-full-scan)
- [ffuf](https://github.com/ffuf/ffuf)
- [SecLists for common paramnames, folder names etc](https://github.com/danielmiessler/SecLists)

## Solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab42-dast.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab42-dast.yml>

<details>
  <summary>Spoiler warning - more info about solution</summary>

### Example to run ZAP

`sudo docker run -v $(pwd):/zap/wrk/:rw -t zaproxy/zap-stable zap-full-scan.py -t http://172.17.0.2:8080`

</details>
