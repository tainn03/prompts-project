---
mode: "agent"
tools: ["codebase"]
description: "Generate DTOs for an entity in the Transportation Management System"
---

Your goal is to generate Data Transfer Objects (DTOs) for a Transportation Management System entity based on the database schema in database_schema.sql.

Ask for the entity name if not provided.

Requirements:

- Create separate DTOs for different use cases:
  - Request DTOs for input data
  - Response DTOs for output data
  - Create/Update DTOs if they differ
  - List/Summary DTOs for collections
- Match DTO structure with database schema table fields
- Add appropriate validation annotations that match database constraints
- Include documentation comments
- Create mapper classes/methods to convert between entities and DTOs
- Handle enum conversions properly using the exact enum types from the schema
- Use appropriate patterns (builder, etc.) for complex DTOs
- Consider implementing serialization/deserialization customizations if needed
- Handle relationship mapping appropriately (one-to-many, many-to-many)

Implementation guidelines:

- Use immutable DTOs where appropriate
- Create nested DTOs for complex object hierarchies
- Include appropriate constructors and accessors
- Consider using MapStruct or manual mapping for entity-DTO conversions
- Add custom validation groups if needed
- Implement proper handling of organization-specific data
- Consider implementing versioning strategy for DTOs
- Add pagination support for list responses
- Include proper error response DTOs
