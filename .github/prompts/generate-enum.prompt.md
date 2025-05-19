---
mode: "agent"
tools: ["codebase"]
description: "Generate Java enum types based on database schema"
---

Your goal is to generate Java enum types for the Transportation Management System based on the ENUM types defined in database_schema.sql.

Ask for the enum type name if not provided.

Requirements:

- Create proper Java enum types that match exactly the ENUM types defined in database_schema.sql
- Use proper Java enum naming conventions (PascalCase for enum name, SCREAMING_SNAKE_CASE for values)
- Add appropriate annotations for JPA (e.g., `@Enumerated(EnumType.STRING)`)
- Include documentation comments explaining the purpose of each enum
- Add methods for conversion between string and enum values if needed
- Structure the package hierarchy appropriately

Available enum types in the schema include:

- Gender (MALE, FEMALE, UNKNOWN)
- UserLinkedAccountProvider (GOOGLE, FACEBOOK, APPLE, MICROSOFT)
- MaintenanceTypeType (VEHICLE, TRAILER)
- UnitOfMeasureType (CUBIC_METER, KILOGRAM, TON, PALLET)
- AdministrativeUnitType (COUNTRY, CITY, DISTRICT, WARD)
- VehicleFuelType (GASOLINE, DIESEL, ELECTRIC, HYBRID, OTHER)
- VehicleOwnerType (ORGANIZATION, SUBCONTRACTOR)
- DriverContractType (FIXED_TERM, PERMANENT)
- CustomerType (FIXED, CASUAL)
- RouteType (FIXED, NON_FIXED)
- OrderType (IMPORT, TRANSHIPMENT)
- OrderStatusType (NEW, RECEIVED, IN_PROGRESS, COMPLETED, CANCELED)
- OrderTripStatusType (various statuses)
- And many others defined in database_schema.sql

Implementation guidelines:

- Place enums in appropriate packages based on their domain
- Use Java best practices for enum implementation
- Consider using interfaces or annotations to categorize similar enums
- Add utility methods where appropriate
