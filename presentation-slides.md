## Security safeguards in Continuous Integration

Lorem ipsum

---page---

# Detect threats

```md [1|2|3|4]
🟢 Detect succesful (good)
🟢 Tool not run (bad)
🔴 Tool failed (bad)
🔴 Detected and failed (bad)
```

- Start from this
- Stick with this with slow tests

---note---

If the point is to detect and not prevent, then build failures are soon to be dismissed if they by default always fail.

---page---

## Prevent threats

```md [1|2|3|4]
🟢 No threats (good)
🔴 Prevention successful (good)
🔴 Tool failed (bad)
🟢 Tool not run (bad)
```

- Requires high security maturity

---note---

False positive, false negative, true positive, true negative etc.

---page---

## Software Composition Analysis (SCA)

**Threat**: Vulnerable and outdated components (OWASP TOP 10). Mend could be used for this.

```pwsh [3]
dotnet restore
dotnet build
dotnet list-package --vulnerable --include-transitive
```

```pwsh [2]
npm install -g retire
retire --path . --outputformat text --outputpath ./reports/output.txt --severity low --exitwith 1 --deep
```

```pwsh [1]
dependency-check.bat --project "My App Name" --scan "folder_path"
```

---page---

## Package locks

**Threat**: Transitive dependencies changes with new malicious patch version

```pwsh [2|4|6]
# Create lock file
dotnet restore --force --use-lock-file
# Restore in locked mode
dotnet restore --locked-mode
# Build without restore
dotnet build --no-restore
```

---page---

## License check

**Threat**: Violation of license agreement or incompatible license

```pwsh [2]
dotnet tool install -g dotnet-delice
dotnet delice your.sln --json
```

```pwsh [2]
npm install -g license-checker
license-checker
```

```pwsh [1]
scancode -clpeui -n 2 --ignore "*.java" --json-pp sample.json samples
```

---page---

## Software Bill of Materials (SBOM)

**Threat**: Vulnerable and outdated components (OWASP TOP 10). Needs something like Dependency Track in addition.

```pwsh [2]
dotnet tool install --global CycloneDX
dotnet CycloneDX ci-security.sln --json --exclude-dev -o ./cyclone-reports
```

---page---

## Static Application Security Testing (SAST)

**Threat**: Pretty much all of OWASP TOP 10 risks

```pwsh [2]
python3 -m pip install semgrep
semgrep scan --config auto
```

```pwsh [1-6]
docker run \
    --rm \
    -e SONAR_HOST_URL="http://${SONARQUBE_URL}"  \
    -e SONAR_TOKEN="myAuthenticationToken" \
    -v "${YOUR_REPO}:/usr/src" \
    sonarsource/sonar-scanner-cli
```

Tons of tools available. Best are costing money. Roslyn Analyzers would be free.

---page---

## Secret scanning

**Threat**: Publishing secrets to version control as clear text. (OWASP TOP 10: Cryptographic failure)

```pwsh [1]
trufflehog git file://. --results=verified,unknown --fail
```

```pwsh [1]
gitleaks git --report-path gitleaks-report.json
```

---page---

## Infrastructure As Code Scanning

**Threat**: OWASP TOP 10 Misconfiguration

```pwsh [2]
pip install checkov
checkov -d /user/tf
```

---page---

## HTTP Header scanning

**Threat**: OWASP TOP 10 Misconfiguration (e.g. missing XSS protections)

```pwsh [1]
venom run --var="target_site=$target" ./oshp_validator_tests_suite.yml
```

---page---

## TLS scanning

**Threat**: OWASP TOP 10 Misconfiguration (weak transport layer security)

```pwsh [1]
docker run -v ${{github.workspace}}/testsslreports:/testsslreports:rw --rm drwetter/testssl.sh --jsonfile /testsslreports $targetIp
```

---page---

## Dynamic Application Security Testing (DAST)

**Threat**: OWASP TOP 10

```pwsh [1]
docker run -v ${{github.workspace}}/zapreports:/zap/wrk:rw -t ghcr.io/zaproxy/zaproxy:stable zap-full-scan.py -t $target -J report_json.json -w report_md.md -r report_html.html -a
```

```pwsh [1]
docker run -v ${{github.workspace}}/nucleireports:/reports:rw -t projectdiscovery/nuclei:latest -u $target -j -v -o /reports/scan.json
```

```pwsh [2]
Invoke-WebRequest https://raw.githubusercontent.com/danielmiessler/SecLists/refs/heads/master/Discovery/Web-Content/IIS.fuzz.txt -OutFile ./iisfuzz.txt
ffuf -w ./iisfuzz.txt -u $target -json | Out-File "${{github.workspace}}/ffufreports/fuzzoutput.json"
```
