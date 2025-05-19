---
mode: "agent"
tools: ["codebase"]
description: "Generate DB migration scripts for the Transportation Management System"
---

Your goal is to create database migration scripts for the Transportation Management System using Flyway or Liquibase, based on the database schema in database_schema.sql.

Ask for the entity details and migration purpose if not provided.

Requirements:

- Create appropriately named migration files
- Follow proper versioning conventions
- Include both forward and rollback scripts
- Add appropriate comments and documentation
- Handle schema changes safely
- Consider data migration needs
- Follow best practices for the chosen migration tool
- Ensure consistency with existing schema (foreign keys, constraints, etc.)
- Handle enum types correctly

Implementation guidelines for Flyway:

- Use V{version}\_\_{description}.sql naming convention (e.g., V1.0.1\_\_Add_vehicle_maintenance_date.sql)
- Include transaction control (BEGIN/COMMIT)
- Add descriptive comments
- Create separate migrations for schema and data changes
- Add appropriate indexes and constraints
- Handle enum type changes carefully
- Consider organization-specific data isolation

Implementation guidelines for Liquibase:

- Use XML or YAML format
- Include changesets with proper IDs and authors
- Add preconditions where appropriate
- Include rollback instructions
- Group related changes logically
- Handle custom enum types correctly
- Consider the impact on existing data
- Include changesets with proper IDs and authors
- Add preconditions where appropriate
- Include rollback instructions
- Group related changes logically
