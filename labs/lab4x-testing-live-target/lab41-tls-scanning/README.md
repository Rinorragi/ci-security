# Lab41 - TLS Cipher scanning

| Title          | Description                                                                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Target         | Check your applications TLS cipher suites                                                                                                                                                              |
| Difficulty     | Hard                                                                                                                                                                                                   |
| Measure        | TLS cipher suite strength                                                                                                                                                                              |
| Threat         | [OWASP TOP 10: Misconfiguration](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)                                                                                                             |
| Detect         | Weak or non-existent transport layer security                                                                                                                                                          |
| Prevent        | Weak or non-existent transport layer security                                                                                                                                                          |
| Stage          | Deploy                                                                                                                                                                                                 |
| Known problems | You need live target and sometimes it is not public. So you might need an agent inside your network to do this. Depending also on complexity of infrastructure this might differ between environments. |

Transport Layer Security (TLS) ensures data confidentiality and integrity over the network. However, older or misconfigured versions and ciphers can expose security weaknesses. Tools like `Nmap`, `Qualys`, or `OpenSSL` can help reveal whether outdated protocols (e.g., TLS 1.0) or insecure ciphers (e.g., RC4) remain in your environment, allowing you to take corrective action before attackers exploit those vulnerabilities.

In this lab, you’ll scan a domain’s TLS configuration to identify which ciphers and TLS versions are in use.

## Scan TLS version

Scan TLS versions of the dockerized application. Check the [vulnerable-pipeline](/.github/workflows/vulnerable-pipeline.yml) to see how to run the application in a docker.

## Links

- testssl: <https://testssl.sh/>
- nmap enum ciphers: <https://nmap.org/nsedoc/scripts/ssl-enum-ciphers.html>
- Qualys API: <https://docs.qualys.com/en/vm/api/index.htm>
- openssl-ciphers: <https://docs.openssl.org/3.3/man1/openssl-ciphers/#cipher-list-format>

## Example solution

- Code: <https://github.com/Rinorragi/ci-security/blob/release/examples/.github/workflows/lab10-tls-scanning.yml>
- Runs: <https://github.com/Rinorragi/ci-security/actions/workflows/lab10-tls-scanning.yml>

There are online options like Qualys API or offline options like openssl and nmap to fetch TLS ciphers from online target. Network devices and the client machine might could cause some variances on the results so plan carefully how you do this in real environment.
