name: Feature Request
description: Suggest an improvement
title: "[FEATURE] "
labels: ["enhancement"]
body:
  - type: markdown
    attributes:
      value: "What would improve this project?"
  
  - type: textarea
    id: problem
    attributes:
      label: Problem Statement
      description: What problem does this solve?
      placeholder: "Currently, it's hard to..."
    validations:
      required: true
  
  - type: textarea
    id: solution
    attributes:
      label: Proposed Solution
      description: How should this be implemented?
    validations:
      required: true
  
  - type: textarea
    id: alternatives
    attributes:
      label: Alternative Approaches
      description: Other solutions considered
