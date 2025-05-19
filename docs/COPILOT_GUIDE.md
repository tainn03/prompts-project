# Transportation Management System - Copilot Setup Documentation

This document provides detailed information on how to use GitHub Copilot prompts with this project.

## Database Schema Reference

Before using the prompts, please review the [DATABASE_SCHEMA_REFERENCE.md](DATABASE_SCHEMA_REFERENCE.md) file to understand the database structure, enum types, and table relationships. This will help you create more accurate and effective prompts.

## Available Prompts

The project includes several predefined prompts in the `.github/prompts` directory:

### 1. Entity Generation

File: `generate-entity.prompt.md`

Use this prompt to generate JPA entities that align with the database schema.

Example usage:

```
Generate a Vehicle entity based on the database schema with all relationships and enum mappings.
```

### 2. Enum Generation

File: `generate-enum.prompt.md`

Use this prompt to generate Java enum types based on the ENUM types defined in database_schema.sql.

Example usage:

```
Generate the VehicleFuelType enum based on the database schema.
```

### 3. Controller Generation

File: `generate-controller.prompt.md`

Use this prompt to generate RESTful controllers with CRUD operations and appropriate validations.

Example usage:

```
Generate a controller for the Route entity with standard CRUD operations and pagination support.
```

### 4. Service Generation

File: `generate-service.prompt.md`

Use this prompt to generate service layer components with business logic and transaction management.

Example usage:

```
Create a service for the User entity with methods for user registration, authentication, and profile management.
```

### 5. Repository Generation

File: `generate-repository.prompt.md`

Use this prompt to generate Spring Data JPA repositories with custom query methods.

Example usage:

```
Generate a repository for the Vehicle entity with methods to find vehicles by status, owner type, and tracking status.
```

### 6. DTO Generation

File: `generate-dto.prompt.md`

Use this prompt to create Data Transfer Objects and mapper classes.

Example usage:

```
Create DTOs for the Route entity including request DTO, response DTO, and mapper methods that handle all relationships.
```

### 7. Test Generation

File: `generate-tests.prompt.md`

Use this prompt to generate unit and integration tests.

Example usage:

```
Generate unit and integration tests for the VehicleService component.
```

### 8. Database Migration

File: `generate-db-migration.prompt.md`

Use this prompt to create database migration scripts.

Example usage:

```
Create a migration script to add a new column to the vehicles table.
```

### 9. Configuration Generation

File: `generate-configuration.prompt.md`

Use this prompt to create application configuration files.

Example usage:

```
Generate configuration properties for security settings with JWT authentication.
```

### 10. Exception Handling

File: `generate-exception-handling.prompt.md`

Use this prompt to create exception handling components.

Example usage:

```
Create exception handling for resource not found scenarios and validation errors.
```

### 11. Complete Module Generation

File: `generate-module.prompt.md`

Use this prompt to generate a complete module (entity, DTO, repository, service, controller, tests).

Example usage:

```
Generate a complete Driver module with all necessary components.
```

## Best Practices

1. **Reference the Database Schema**: Always refer to the database schema when creating entities and DTOs
2. **Use Enum Types Correctly**: Make sure to use the exact enum values as defined in the database schema
3. **Be Specific**: Provide detailed information in your prompts for better results
4. **Review Generated Code**: Always review and test code before committing
5. **Follow Project Conventions**: Ensure generated code follows project structure and naming conventions
6. **Handle Multi-tenancy**: Remember that most entities have an organization_id field for multi-tenancy
7. **Test Coverage**: Always verify that generated code has appropriate test coverage

## Integration with GitHub Workflow

1. Use the issue templates in `.github/ISSUE_TEMPLATE` for structured Copilot requests
2. Reference the generated components in your pull requests
3. Follow the workflow defined in the CI/CD pipeline

## Additional Resources

- [Spring Data JPA Documentation](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
- [Java Bean Validation API](https://jakarta.ee/specifications/bean-validation/3.0/jakarta-bean-validation-spec-3.0.html)

## Extending Prompts

To create new prompts:

1. Create a new file in the `.github/prompts` directory with the `.prompt.md` extension
2. Follow the existing prompt format with metadata and requirements
3. Add descriptive instructions
4. Document the new prompt in this guide
