---
mode: "agent"
tools: ["codebase"]
description: "Generate a complete module for the Transportation Management System"
---

Your goal is to generate a complete set of files for a module in the Transportation Management System.

Ask for the entity name and its fields if not provided.

Requirements:

- Generate all necessary files for the module:
  - Entity class
  - DTOs (Request/Response)
  - Repository interface
  - Service interface and implementation
  - Controller
  - Validation logic
  - Unit tests and integration tests
- Follow Spring Boot best practices
- Ensure proper relationship handling
- Include appropriate documentation
- Add business-specific validation and logic

Implementation guidelines:

- Create files in the appropriate package structure
- Use consistent naming conventions
- Include comprehensive error handling
- Follow RESTful API design principles
- Implement pagination for collections
- Add appropriate logging
- Consider security aspects (authentication/authorization)
- Add comprehensive test coverage
