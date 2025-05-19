name: Pull Request Template
description: Template for creating pull requests

title: "[PR] "
body:

- type: markdown
  attributes:
  value: |
  Thanks for submitting a pull request! Please fill in the details below.
- type: input
  id: ticket
  attributes:
  label: Related Issue
  description: Link to the issue this PR addresses
  placeholder: "#123"
  validations:
  required: false
- type: textarea
  id: description
  attributes:
  label: Description
  description: Describe the changes you've made
  placeholder: This PR adds...
  validations:
  required: true
- type: textarea
  id: testing
  attributes:
  label: Testing
  description: Describe how you tested these changes
  placeholder: Added unit tests for...
  validations:
  required: true
- type: dropdown
  id: type
  attributes:
  label: Type of Change
  description: What type of change does this PR introduce?
  options: - Bug fix - New feature - Breaking change - Documentation update - Code refactoring - Performance improvement - Tests - Build/CI - Other
  validations:
  required: true
- type: checkboxes
  id: checklist
  attributes:
  label: Checklist
  options: - label: I have updated the documentation accordingly
  required: false - label: I have added tests that prove my fix or feature works
  required: false - label: My changes generate no new warnings
  required: true - label: I have performed a self-review of my code
  required: true
