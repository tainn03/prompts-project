---
mode: "agent"
tools: ["codebase"]
description: "Generate a new repository for the Transportation Management System"
---

Your goal is to generate a new Spring Data JPA repository for a Transportation Management System entity based on the database schema in database_schema.sql.

Ask for the entity name if not provided.

Requirements:

- Extend appropriate Spring Data interfaces (JpaRepository, PagingAndSortingRepository, etc.)
- Add custom query methods with proper naming conventions aligned with table structure in database_schema.sql
- Use JPQL or native queries where appropriate for complex queries
- Add custom repository methods for complex operations based on database relationships and link tables
- Include proper documentation comments
- Create specification classes for dynamic queries if needed
- Consider adding query projections for optimized data retrieval
- Add proper pagination and sorting support

Example methods to include based on entity type:

For Vehicle repositories:

- findByRegistrationNumber, findByVehicleTypeId, findByFuelType, findByOwnerType
- findByIsActiveTrue, findByTrackingStatus
- findByOrganizationIdAndIsActiveTrue

For Order repositories:

- findByCustomerId, findByStatus, findByType, findByCreatedAtBetween
- findByCodeContaining, findByDeliveryDateBetween
- findByOrganizationIdAndStatusIn

For User repositories:

- findByUsername, findByEmail, findByPhoneNumber
- findByIsActiveTrue, findByIsAdminTrue
- findByOrganizationId

For Organization repositories:

- findByCode, findByName, findByIsActiveTrue
- findByCodeContainingOrNameContaining

Implementation guidelines:

- Group related query methods together
- Use method naming conventions that clearly express the query intent
- Provide appropriate return types (List, Page, Optional, etc.)
- Use query derivation for simple queries
- Use @Query for complex queries
- Consider performance implications for complex joins

For Route repositories:

- findByCode, findByCustomerId, findByType, findByIsActiveTrue
- findByDistanceGreaterThan, findByPickupPointsContaining

For User repositories:

- findByUsername, findByEmail, findByIsAdminTrue
- findByOrganizationId, findByRoleId

Include appropriate query methods for:

- CRUD operations (inherited from base repository)
- Find by specific attributes according to the schema
- Custom search methods with multiple parameters
- Aggregate operations (count, sum, avg) for reporting
- Entity relationship traversal methods using join tables
