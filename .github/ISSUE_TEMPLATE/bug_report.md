name: Bug Report
description: Report an issue with the whitepaper or build process
title: "[BUG] "
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: |
        Thanks for reporting! Please provide as much detail as possible.
  
  - type: textarea
    id: description
    attributes:
      label: Description
      description: Clear description of the issue
      placeholder: "What went wrong?"
    validations:
      required: true
  
  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: How to reproduce the issue
      placeholder: |
        1. Run `bash scripts/build.sh`
        2. Observe...
    validations:
      required: true
  
  - type: textarea
    id: expected
    attributes:
      label: Expected Behavior
      description: What should happen
    validations:
      required: true
  
  - type: input
    id: system
    attributes:
      label: System Information
      placeholder: "OS, TeX version, etc."
    validations:
      required: false
  
  - type: textarea
    id: logs
    attributes:
      label: Error Logs
      description: Any error messages or build output
      render: shell
