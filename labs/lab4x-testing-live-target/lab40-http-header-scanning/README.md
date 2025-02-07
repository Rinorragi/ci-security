# Lab40 - HTTP Header scanning

| Title          | Description                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Target         | Check if your application HTTP security headers are implemented as they should                                                                         |
| Difficulty     | Medium                                                                                                                                                 |
| Measure        | HTTP header secure score                                                                                                                               |
| Threat         | [OWASP TOP 10: Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/). Also E.g. Content-Security-Policy protects against XSS. |
| Detect         | Misconfiguration in HTTP headers                                                                                                                       |
| Prevent        | Misconfigurations in HTTP headers                                                                                                                      |
| Stage          | Deploy                                                                                                                                                 |
| Known problems | You need live target and sometimes it is not public. So you might need an agent inside your network to do this.                                        |

HTTP headers play a vital role in securing web applications. Scanning these headers can uncover missing or misconfigured security directives — such as `Content-Security-Policy` or `Strict-Transport-Security` — that help defend against attacks like clickjacking and cross-site scripting. By using tools like `MDN HTTP Observatory`, you can quickly assess your site’s HTTP security posture, identify weaknesses, and implement fixes before a vulnerability becomes critical.

Good tools for this task are:

Online:

- Mozilla Observatory: <https://github.com/mdn/mdn-http-observatory/>
- Securityheaders: <https://securityheaders.com/>

Offline:

- OWASP Secure Headers Project validator (using venom): <https://github.com/oshp/oshp-validator>

## Scan HTTP headers

In this lab, you’ll set up a workflow to scan the HTTP headers of your web application using `MDN HTTP Observatory`. You can ask for a target if you don't have one. This is not something that would be very intrusive. You can also try `OSHP validator` and running the target in docker. Check the [vulnerable-pipeline](/.github/workflows/vulnerable-pipeline.yml) to see how to run the app in docker.

## Links

- Mozilla Observatory: <https://github.com/mdn/mdn-http-observatory/>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab40-http-header-scanning.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab40-http-header-scanning.yml>
