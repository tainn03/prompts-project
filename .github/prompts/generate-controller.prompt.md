---
mode: "agent"
tools: ["codebase"]
description: "Generate a new Spring REST controller for an entity"
---

Your goal is to generate a new Spring Boot REST controller for a given entity in the Transportation Management System.

Ask for the entity name and its fields if not provided.

Requirements:

- Use standard Spring Boot annotations (`@RestController`, `@RequestMapping`, etc.)
- Use constructor injection for dependencies
- Generate CRUD endpoints (GET, POST, PUT, DELETE)
- Implement pagination and sorting for list endpoints
- Use the corresponding service and repository
- Use DTOs for request/response bodies that match entity structure
- Add proper validation annotations based on database constraints
- Add proper error handling with appropriate HTTP status codes
- Implement proper security controls using Spring Security
- Write comprehensive API documentation using Swagger annotations
- Follow RESTful API best practices
- Write type-safe code with clear method signatures

Implementation guidelines:

- Use consistent URL patterns (/api/v1/[entity-plural])
- Structure endpoints logically (e.g., `/vehicles/{id}/maintenance`)
- Follow proper naming conventions for methods and variables
- Implement proper handling of related entities
- Add appropriate logging
- Include handling for common error scenarios
