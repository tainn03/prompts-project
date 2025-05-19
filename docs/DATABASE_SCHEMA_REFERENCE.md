# Transportation Management System Database Schema Reference

This document provides an overview of the key database schema elements in the TMS system to help with GitHub Copilot prompt creation and entity generation.

## Enum Types

The system uses the following enum types:

### User Related

- `Gender`: MALE, FEMALE, UNKNOWN
- `UserLinkedAccountProvider`: GOOGLE, FACEBOOK, APPLE, MICROSOFT
- `TokenType`: ACCOUNT_ACTIVATION, FORGOT_PASSWORD, INVITATION_CODE, PASSWORDLESS, VERIFICATION_EMAIL, VERIFICATION_PHONE_NUMBER
- `OrganizationRoleType`: ADMIN, MANAGER, ACCOUNTANT, DISPATCH_MANAGER, DISPATCHER, CUSTOMER, DRIVER

### Vehicle Related

- `VehicleFuelType`: GASOLINE, DIESEL, ELECTRIC, HYBRID, OTHER
- `VehicleOwnerType`: ORGANIZATION, SUBCONTRACTOR
- `VehicleTrackingStatus`: ACTIVE, STOPPED, NO_SIGNAL, STOPPED_WITH_ENGINE_ON
- `MaintenanceTypeType`: VEHICLE, TRAILER
- `TrailerOwnerType`: ORGANIZATION, SUBCONTRACTOR

### Order & Trip Related

- `OrderType`: IMPORT, TRANSHIPMENT
- `OrderStatusType`: NEW, RECEIVED, IN_PROGRESS, COMPLETED, CANCELED
- `OrderTripStatusType`: NEW, PENDING_CONFIRMATION, CONFIRMED, WAITING_FOR_PICKUP, WAREHOUSE_GOING_TO_PICKUP, WAREHOUSE_PICKED_UP, WAITING_FOR_DELIVERY, DELIVERED, COMPLETED, CANCELED
- `OrderGroupStatusType`: PLAN, APPROVED, IN_PROGRESS, INBOUND, IN_STOCK, OUTBOUND, TRANSHIPMENT, DELIVERED, COMPLETED, CANCELED
- `RouteType`: FIXED, NON_FIXED
- `OrderParticipantRole`: OWNER, EDITOR, VIEWER
- `OrderTripMessageType`: NEW, PENDING_CONFIRMATION, CONFIRMED, WAITING_FOR_PICKUP, WAREHOUSE_GOING_TO_PICKUP, WAREHOUSE_PICKED_UP, WAITING_FOR_DELIVERY, DELIVERED, COMPLETED, CANCELED

### Organization & Administration Related

- `AdministrativeUnitType`: COUNTRY, CITY, DISTRICT, WARD
- `OrganizationInitialValueType`: DRIVER_LICENSE_TYPE, DRIVER_REPORT, DRIVER_EXPENSE, MAINTENANCE_TYPE, MERCHANDISE_TYPE, ORGANIZATION_ROLE, TRAILER_TYPE, UNIT_OF_MEASURE, VEHICLE_TYPE
- `OrganizationSettingOrderCodeGenerationType`: DEFAULT, ROUTE_SPECIFIC, CUSTOMER_SPECIFIC
- `OrganizationSettingExtendedValueType`: STRING, NUMBER, BOOLEAN, DATE, DATETIME, JSON
- `DriverContractType`: FIXED_TERM, PERMANENT
- `CustomerType`: FIXED, CASUAL

### Miscellaneous

- `UnitOfMeasureType`: CUBIC_METER, KILOGRAM, TON, PALLET
- `SMTPSettingSecurity`: NONE, SSL_TLS, STARTTLS, AUTO
- `EmailTemplateType`: TEST_EMAIL, ACCOUNT_ACTIVATION, WELCOME, VERIFICATION_CODE, ADMIN_NEW_ORGANIZATION, USER_NEW_ORGANIZATION, ORGANIZATION_INVITATION, PASSWORD_CHANGED, RESET_PASSWORD
- `WorkflowType`: IMPORT_CARGO, EXPORT_CARGO, BULK_CARGO
- `AccessLogType`: ORDER, TRIP, SIGNIN
- `ShareObjectType`: ORDER, TRIP
- `AdvanceType`: DRIVER, SUBCONTRACTOR
- `AdvanceAdvanceType`: SALARY, COST
- `Advance為Status`: PENDING, REJECTED, ACCEPTED, PAYMENT
- `NotificationType`: Multiple notification types
- `DriverExpenseType`: DRIVER_COST
- `FuelType`: GASOLINE, DIESEL
- `ExpenseTypeType`: LOLO, CONTAINER_DEPOSIT, DETENTION_FEE
- `CustomFieldType`: CUSTOMER, SUBCONTRACTOR, DRIVER, ORDER, VEHICLE, TRAILER, ROUTE_POINT, ORDER_TRIP
- `CustomFieldDataType`: TEXT, EMAIL, NUMBER, CHOICE, DATE, DATETIME, BOOLEAN, FILE
- `DynamicAnalysisType`: REPORT, WIDGET
- `DynamicAnalysisFilterDataType`: TEXT, NUMBER, CHOICE, DATE, DATETIME, BOOLEAN, DRIVER, VEHICLE

## Key Tables

### User Management

- `up_users`: Core user table with authentication details
- `user_details`: Personal information about users
- `user_settings`: User preferences and settings
- `user_linked_accounts`: External authentication providers

### Organization Management

- `organizations`: Company/business information
- `organization_members`: User-organization relationships
- `organization_roles`: Role definitions within organizations
- `organization_settings`: Organization-specific configuration
- `organization_setting_extended`: Additional configurable settings

### Vehicle Management

- `vehicle_types`: Types of vehicles in the system
- `maintenance_types`: Types of maintenance activities

### Location Management

- `administrative_units`: Hierarchical location data (countries, cities, etc.)
- `address_informations`: Physical address details

### Document Management

- `upload_files`: File metadata storage
- `upload_folders`: Folder organization for files

### Workflow and Process Management

- `workflows`: Process definitions for different operations
- `driver_reports`: Reporting templates for drivers
- `driver_report_details`: Detailed reporting fields

### Additional Features

- `tokens`: Security tokens for various authentication flows
- `email_templates`: Templates for system emails
- `smtp_settings`: Email server configuration
- `merchandise_types`: Types of goods/merchandise
- `unit_of_measures`: Measurement units for cargo

## Common Relationships

The schema extensively uses link tables to create many-to-many relationships, following the pattern:

- `entity1_entity2_links`: Links entity1 and entity2 with additional metadata

Common audit fields in most tables:

- `created_at`: Creation timestamp
- `created_by_id`: User who created the record
- `updated_at`: Last update timestamp
- `updated_by_id`: User who last updated the record
- `published_at`: When the record became publicly available
- `is_active`: Whether the record is currently active
