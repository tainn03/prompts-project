---
mode: "agent"
tools: ["codebase"]
description: "Generate unit and integration tests for the Transportation Management System"
---

Your goal is to generate comprehensive tests for a Transportation Management System component based on the database schema in database_schema.sql.

Ask for the component type (entity, repository, service, controller) and name if not provided.

Requirements:

- Create unit tests for the specified component
- Add integration tests where appropriate
- Use JUnit 5 and Spring Boot Test
- Implement proper test fixtures and test data that align with database constraints
- Use Mockito for mocking dependencies
- Add proper assertions
- Test both success and failure scenarios
- Include edge cases and boundary value tests
- Add test documentation comments
- Test organization-specific data isolation (multi-tenancy)

Implementation guidelines:

- Organize tests in a clear, readable structure
- Use descriptive test method names (given_when_then pattern)
- Create test utility classes for common test operations
- Use appropriate test annotations (@Test, @DisplayName, etc.)
- Set up proper test configurations
- Test validation constraints defined in entity classes
- Test proper mapping of enum types
- For repositories: test custom queries and operations
- For services: test business logic and exception handling
- For controllers: test request/response handling, status codes, and security
- For entities: test validations, relationships, and constraints
- For controllers: test request/response handling and status codes
- For entities: test validations and relationships
