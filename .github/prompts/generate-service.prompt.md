---
mode: "agent"
tools: ["codebase"]
description: "Generate a new service for the Transportation Management System"
---

Your goal is to generate a new Spring service layer component for a Transportation Management System entity based on the database schema in database_schema.sql.

Ask for the entity name if not provided.

Requirements:

- Use Spring annotations (`@Service`, etc.)
- Use constructor injection for repository and other dependencies
- Implement business logic for entity operations consistent with database schema
- Handle exceptions properly with custom exception classes
- Add appropriate transaction management (`@Transactional`)
- Include proper logging with SLF4J
- Add comprehensive documentation comments
- Write methods for all CRUD operations and business-specific operations
- Add validation logic that enforces database constraints
- Implement proper error handling strategies
- Handle organization-specific data separation (multi-tenant approach)

Implementation guidelines:

- Create a service interface and implementation class
- Use DTOs for input/output that properly reflect the database structure
- Consider implementing optimistic locking for concurrent modifications
- Add proper pagination support for list operations
- Consider caching strategies for frequently accessed data
- Properly handle relationships between entities using link tables
- Implement proper security checks for data access

Entity-specific business logic examples:

For User/Driver services:

- User authentication and authorization flows
- Driver availability and assignment logic
- Profile management, including linked accounts

For Vehicle services:

- Vehicle tracking and status management
- Maintenance scheduling and alerts
- Vehicle assignment and capacity management

For Order/Trip services:

- Order workflow management based on OrderStatusType
- Trip planning and optimization
- Real-time status tracking and updates

For Organization services:

- Multi-tenant data isolation
- Organization settings management
- Role-based access control

For Vehicle services:

- Vehicle tracking status updates
- Maintenance scheduling and tracking
- Owner/assignment management

For Order services:

- Order status transitions complying with OrderStatusType enum
- Order trip relationship management
- Customer relation handling

For Route services:

- Route point sequence management
- Distance and price calculations
- Route optimization features

For User services:

- User authentication and authorization
- Organization member management
- Role-based permission handling

Include standard audit features like created/updated timestamps that match database fields
