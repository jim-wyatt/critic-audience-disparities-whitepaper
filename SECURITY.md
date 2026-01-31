# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please report it by emailing the maintainer directly rather than opening a public issue.

**Please include the following information:**

- Type of vulnerability
- Full paths of source file(s) related to the issue
- Location of the affected source code (tag/branch/commit or direct URL)
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

## Security Best Practices

This repository implements several security measures:

- **Secret Scanning**: Automated detection of accidentally committed secrets
- **Push Protection**: Prevents commits containing secrets from being pushed
- **Dependabot**: Automated dependency updates for GitHub Actions
- **Branch Protection**: Main branch is protected against force pushes and deletion
- **Status Checks**: All changes must pass automated builds before merging

## Disclosure Policy

When we receive a security vulnerability report, we will:

1. Confirm receipt of your report within 48 hours
2. Investigate and validate the issue
3. Develop a fix and prepare a security advisory
4. Release a patched version
5. Publicly disclose the vulnerability with appropriate credit to the reporter

## Security Update Process

Security updates are released as soon as possible after a vulnerability is confirmed and fixed. Users are notified via:

- GitHub Security Advisories
- Release notes with security tags
- Repository security tab

Thank you for helping keep this project secure!
