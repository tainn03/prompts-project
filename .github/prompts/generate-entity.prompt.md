---
mode: "agent"
tools: ["codebase"]
description: "Generate a new entity for the Transportation Management System"
---

Your goal is to generate a new JPA entity for the Transportation Management System based on the database schema.

Ask for the entity name and its fields if not provided.

Requirements:

- Use JPA annotations (`@Entity`, `@Table`, etc.) with the correct table name from database_schema.sql
- Create proper relationships between entities if needed using the link tables from the schema
- Use validation annotations where appropriate (`@NotNull`, `@Size`, etc.)
- Include appropriate constructors, getters, setters (or use Lombok)
- Add proper indexes for frequently queried fields
- Define appropriate cascade types for entity relationships based on database constraints
- Use `@Column` annotations with specific parameters matching the SQL schema
- Include proper documentation comments
- Add audit fields (created/updated timestamps) matching the database schema
- Create proper enum types that match the ENUM types defined in database_schema.sql

Common entity types in this TMS based on the database schema:

- User/Organization entities (`up_users`, `user_details`, etc.)
- Vehicle management (`vehicles`, `vehicle_types`, etc.)
- Route management (`routes`, `route_points`, etc.)
- Order processing (`orders`, `order_trips`, etc.)
- Customer management (`customers`, etc.)
- Driver management (`drivers`, `driver_licenses`, etc.)
- Organization settings and configuration

For enum types, use the exact values from database_schema.sql, such as:

- Gender (MALE, FEMALE, UNKNOWN)
- VehicleFuelType (GASOLINE, DIESEL, ELECTRIC, HYBRID, OTHER)
- RouteType (FIXED, NON_FIXED)
- OrderType (IMPORT, TRANSHIPMENT)
- OrderStatusType (NEW, RECEIVED, IN_PROGRESS, COMPLETED, CANCELED)
- OrderTripStatusType (NEW, PENDING_CONFIRMATION, etc.)
