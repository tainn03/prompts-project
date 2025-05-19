-- Creating ENUM types
CREATE TYPE Gender AS ENUM ('MALE', 'FEMALE', 'UNKNOWN');
CREATE TYPE UserLinkedAccountProvider AS ENUM ('GOOGLE', 'FACEBOOK', 'APPLE', 'MICROSOFT');
CREATE TYPE MaintenanceTypeType AS ENUM ('VEHICLE', 'TRAILER');
CREATE TYPE UnitOfMeasureType AS ENUM ('CUBIC_METER', 'KILOGRAM', 'TON', 'PALLET');
CREATE TYPE AdministrativeUnitType AS ENUM ('COUNTRY', 'CITY', 'DISTRICT', 'WARD');
CREATE TYPE OrganizationInitialValueType AS ENUM ('DRIVER_LICENSE_TYPE', 'DRIVER_REPORT', 'DRIVER_EXPENSE', 'MAINTENANCE_TYPE', 'MERCHANDISE_TYPE', 'ORGANIZATION_ROLE', 'TRAILER_TYPE', 'UNIT_OF_MEASURE', 'VEHICLE_TYPE');
CREATE TYPE SMTPSettingSecurity AS ENUM ('NONE', 'SSL_TLS', 'STARTTLS', 'AUTO');
CREATE TYPE EmailTemplateType AS ENUM ('TEST_EMAIL', 'ACCOUNT_ACTIVATION', 'WELCOME', 'VERIFICATION_CODE', 'ADMIN_NEW_ORGANIZATION', 'USER_NEW_ORGANIZATION', 'ORGANIZATION_INVITATION', 'PASSWORD_CHANGED', 'RESET_PASSWORD');
CREATE TYPE TokenType AS ENUM ('ACCOUNT_ACTIVATION', 'FORGOT_PASSWORD', 'INVITATION_CODE', 'PASSWORDLESS', 'VERIFICATION_EMAIL', 'VERIFICATION_PHONE_NUMBER');
CREATE TYPE WorkflowType AS ENUM ('IMPORT_CARGO', 'EXPORT_CARGO', 'BULK_CARGO');
CREATE TYPE VehicleFuelType AS ENUM ('GASOLINE', 'DIESEL', 'ELECTRIC', 'HYBRID', 'OTHER');
CREATE TYPE VehicleOwnerType AS ENUM ('ORGANIZATION', 'SUBCONTRACTOR');
CREATE TYPE VehicleTrackingStatus AS ENUM ('ACTIVE', 'STOPPED', 'NO_SIGNAL', 'STOPPED_WITH_ENGINE_ON');
CREATE TYPE DriverContractType AS ENUM ('FIXED_TERM', 'PERMANENT');
CREATE TYPE CustomerType AS ENUM ('FIXED', 'CASUAL');
CREATE TYPE RouteType AS ENUM ('FIXED', 'NON_FIXED');
CREATE TYPE OrderType AS ENUM ('IMPORT', 'TRANSHIPMENT');
CREATE TYPE OrderStatusType AS ENUM ('NEW', 'RECEIVED', 'IN_PROGRESS', 'COMPLETED', 'CANCELED');
CREATE TYPE AccessLogType AS ENUM ('ORDER', 'TRIP', 'SIGNIN');
CREATE TYPE ShareObjectType AS ENUM ('ORDER', 'TRIP');
CREATE TYPE OrderParticipantRole AS ENUM ('OWNER', 'EDITOR', 'VIEWER');
CREATE TYPE AdvanceType AS ENUM ('DRIVER', 'SUBCONTRACTOR');
CREATE TYPE AdvanceAdvanceType AS ENUM ('SALARY', 'COST');
CREATE TYPE AdvanceStatus AS ENUM ('PENDING', 'REJECTED', 'ACCEPTED', 'PAYMENT');
CREATE TYPE TrailerOwnerType AS ENUM ('ORGANIZATION', 'SUBCONTRACTOR');
CREATE TYPE OrderTripStatusType AS ENUM ('NEW', 'PENDING_CONFIRMATION', 'CONFIRMED', 'WAITING_FOR_PICKUP', 'WAREHOUSE_GOING_TO_PICKUP', 'WAREHOUSE_PICKED_UP', 'WAITING_FOR_DELIVERY', 'DELIVERED', 'COMPLETED', 'CANCELED');
CREATE TYPE OrganizationReportType AS ENUM ('INVOICE', 'DRIVER_SALARY', 'ACCOUNTS_RECEIVABLE', 'AGGREGATE_ACCOUNTS_RECEIVABLE', 'SUBCONTRACTOR_COST', 'FUEL_LOGS', 'ORGANIZATION_TRIPS', 'AGGREGATE_SUBCONTRACTOR_TRIPS', 'ORDER_GROUP_PLAN');
CREATE TYPE OrderTripMessageType AS ENUM ('NEW', 'PENDING_CONFIRMATION', 'CONFIRMED', 'WAITING_FOR_PICKUP', 'WAREHOUSE_GOING_TO_PICKUP', 'WAREHOUSE_PICKED_UP', 'WAITING_FOR_DELIVERY', 'DELIVERED', 'COMPLETED', 'CANCELED');
CREATE TYPE NotificationType AS ENUM ('NEW_ORDER', 'DELETE_ORDER', 'NEW_ORDER_PARTICIPANT', 'ORDER_STATUS_CHANGED', 'ORDER_GROUP_STATUS_CHANGED', 'TRIP_STATUS_CHANGED', 'TRIP_NEW_MESSAGE', 'BILL_OF_LADING_RECEIVED', 'BILL_OF_LADING_DRIVER_REMINDER', 'BILL_OF_LADING_ACCOUNTANT_REMINDER', 'VEHICLE_DOCUMENT_DRIVER_REMINDER', 'VEHICLE_DOCUMENT_OPERATOR_REMINDER', 'NEW_FUEL_LOG', 'TRIP_DRIVER_EXPENSE_CHANGED', 'DRIVER_EXPENSE_RECEIVED', 'ORDER_GROUP_CLOSE_TO_EXPIRE');
CREATE TYPE DriverExpenseType AS ENUM ('DRIVER_COST');
CREATE TYPE FuelType AS ENUM ('GASOLINE', 'DIESEL');
CREATE TYPE OrderGroupStatusType AS ENUM ('PLAN', 'APPROVED', 'IN_PROGRESS', 'INBOUND', 'IN_STOCK', 'OUTBOUND', 'TRANSHIPMENT', 'DELIVERED', 'COMPLETED', 'CANCELED');
CREATE TYPE ExpenseTypeType AS ENUM ('LOLO', 'CONTAINER_DEPOSIT', 'DETENTION_FEE');
CREATE TYPE OrganizationSettingExtendedValueType AS ENUM ('STRING', 'NUMBER', 'BOOLEAN', 'DATE', 'DATETIME', 'JSON');
CREATE TYPE OrganizationSettingOrderCodeGenerationType AS ENUM ('DEFAULT', 'ROUTE_SPECIFIC', 'CUSTOMER_SPECIFIC');
CREATE TYPE OrganizationRoleType AS ENUM ('ADMIN', 'MANAGER', 'ACCOUNTANT', 'DISPATCH_MANAGER', 'DISPATCHER', 'CUSTOMER', 'DRIVER');
CREATE TYPE CustomFieldType AS ENUM ('CUSTOMER', 'SUBCONTRACTOR', 'DRIVER', 'ORDER', 'VEHICLE', 'TRAILER', 'ROUTE_POINT', 'ORDER_TRIP');
CREATE TYPE CustomFieldDataType AS ENUM ('TEXT', 'EMAIL', 'NUMBER', 'CHOICE', 'DATE', 'DATETIME', 'BOOLEAN', 'FILE');
CREATE TYPE DynamicAnalysisType AS ENUM ('REPORT', 'WIDGET');
CREATE TYPE DynamicAnalysisFilterDataType AS ENUM ('TEXT', 'NUMBER', 'CHOICE', 'DATE', 'DATETIME', 'BOOLEAN', 'DRIVER', 'VEHICLE');

-- Creating tables
CREATE TABLE up_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  email VARCHAR(255) UNIQUE,
  email_verified BOOLEAN,
  phone_number VARCHAR(255),
  phone_number_verified BOOLEAN,
  provider VARCHAR(255),
  password VARCHAR(255),
  reset_password_token VARCHAR(255),
  confirmation_token VARCHAR(255),
  confirmed BOOLEAN,
  blocked BOOLEAN,
  is_admin BOOLEAN,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE up_users_role_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  role_id INT,
  user_order INT,
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE user_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATETIME,
  gender Gender,
  description TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE up_users_detail_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  user_detail_id INT,
  FOREIGN KEY (user_id) REFERENCES up_users(id),
  FOREIGN KEY (user_detail_id) REFERENCES user_details(id)
);

CREATE TABLE user_details_address_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_detail_id INT,
  address_information_id INT,
  FOREIGN KEY (user_detail_id) REFERENCES user_details(id)
);

CREATE TABLE user_settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT,
  locale VARCHAR(255),
  last_notification_sent_at DATETIME,
  message_tokens JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE up_users_setting_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  user_setting_id INT,
  FOREIGN KEY (user_id) REFERENCES up_users(id),
  FOREIGN KEY (user_setting_id) REFERENCES user_settings(id)
);

CREATE TABLE user_linked_accounts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  provider UserLinkedAccountProvider NOT NULL,
  email VARCHAR(255),
  user_id VARCHAR(255),
  avatar VARCHAR(255)
);

CREATE TABLE upload_files (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  alternative_text VARCHAR(255),
  caption VARCHAR(255),
  width INT,
  height INT,
  formats JSON,
  hash VARCHAR(255),
  ext VARCHAR(255) NOT NULL,
  mime VARCHAR(255) NOT NULL,
  size FLOAT NOT NULL,
  url VARCHAR(255) NOT NULL,
  preview_url VARCHAR(255),
  provider VARCHAR(255),
  provider_metadata JSON,
  folder_id INT,
  folder_path VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE upload_folders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  path_id INT,
  path VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE maintenance_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type MaintenanceTypeType NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  organization_id INT NOT NULL,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE maintenance_types_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maintenance_type_id INT,
  user_id INT,
  FOREIGN KEY (maintenance_type_id) REFERENCES maintenance_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE maintenance_types_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  maintenance_type_id INT,
  user_id INT,
  FOREIGN KEY (maintenance_type_id) REFERENCES maintenance_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE merchandise_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE merchandise_types_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  merchandise_type_id INT,
  user_id INT,
  FOREIGN KEY (merchandise_type_id) REFERENCES merchandise_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE merchandise_types_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  merchandise_type_id INT,
  user_id INT,
  FOREIGN KEY (merchandise_type_id) REFERENCES merchandise_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE unit_of_measures (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type UnitOfMeasureType,
  organization_id INT NOT NULL,
  code VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_system BOOLEAN DEFAULT FALSE,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE unit_of_measures_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  unit_of_measure_id INT,
  user_id INT,
  FOREIGN KEY (unit_of_measure_id) REFERENCES unit_of_measures(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE unit_of_measures_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  unit_of_measure_id INT,
  user_id INT,
  FOREIGN KEY (unit_of_measure_id) REFERENCES unit_of_measures(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE administrative_units (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  type AdministrativeUnitType NOT NULL,
  parent_code VARCHAR(255),
  level VARCHAR(255),
  country_code VARCHAR(255),
  postal_code VARCHAR(255),
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE administrative_units_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  administrative_unit_id INT,
  user_id INT,
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE administrative_units_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  administrative_unit_id INT,
  user_id INT,
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organizations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(255) UNIQUE NOT NULL,
  alias VARCHAR(255) UNIQUE,
  slug VARCHAR(255) UNIQUE,
  name VARCHAR(255) NOT NULL,
  international_name VARCHAR(255),
  abbreviation_name VARCHAR(255),
  tax_code VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  website VARCHAR(255),
  business_address TEXT,
  contact_name VARCHAR(255),
  contact_position VARCHAR(255),
  contact_email VARCHAR(255),
  contact_phone_number VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  is_active BOOLEAN DEFAULT FALSE,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE organization_initial_values (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type OrganizationInitialValueType NOT NULL,
  data JSON,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE organization_initial_values_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_initial_value_id INT,
  user_id INT,
  FOREIGN KEY (organization_initial_value_id) REFERENCES organization_initial_values(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_initial_values_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_initial_value_id INT,
  user_id INT,
  FOREIGN KEY (organization_initial_value_id) REFERENCES organization_initial_values(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE smtp_settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  server VARCHAR(255),
  port INT,
  from_name VARCHAR(255),
  from_email VARCHAR(255),
  authentication_enabled BOOLEAN DEFAULT TRUE,
  username VARCHAR(255),
  password VARCHAR(255),
  timeout INT,
  security SMTPSettingSecurity DEFAULT 'AUTO',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE email_templates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  locale VARCHAR(255),
  type EmailTemplateType NOT NULL,
  subject VARCHAR(255),
  body TEXT,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE email_templates_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email_template_id INT,
  user_id INT,
  FOREIGN KEY (email_template_id) REFERENCES email_templates(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE email_templates_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email_template_id INT,
  user_id INT,
  FOREIGN KEY (email_template_id) REFERENCES email_templates(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE tokens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type TokenType NOT NULL,
  value VARCHAR(255),
  data TEXT,
  expiration_time DATETIME,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE driver_reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_required BOOLEAN DEFAULT FALSE,
  photo_required BOOLEAN DEFAULT FALSE,
  bill_of_lading_required BOOLEAN DEFAULT FALSE,
  display_order INT DEFAULT 0,
  is_system BOOLEAN DEFAULT FALSE,
  type OrderTripStatusType,
  is_displayed_on_app BOOLEAN DEFAULT TRUE,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE driver_reports_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_report_id INT,
  user_id INT,
  UNIQUE (driver_report_id),
  UNIQUE (user_id),
  FOREIGN KEY (driver_report_id) REFERENCES driver_reports(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE driver_reports_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_report_id INT,
  user_id INT,
  UNIQUE (driver_report_id),
  UNIQUE (user_id),
  FOREIGN KEY (driver_report_id) REFERENCES driver_reports(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE driver_report_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  display_order INT DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE driver_reports_report_details_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_report_id INT,
  driver_report_detail_id INT,
  driver_report_detail_order INT,
  UNIQUE (driver_report_id),
  UNIQUE (driver_report_detail_id),
  FOREIGN KEY (driver_report_id) REFERENCES driver_reports(id),
  FOREIGN KEY (driver_report_detail_id) REFERENCES driver_report_details(id)
);

CREATE TABLE workflows (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  is_system BOOLEAN DEFAULT FALSE,
  is_default BOOLEAN DEFAULT FALSE,
  type WorkflowType,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE workflows_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  workflow_id INT,
  user_id INT,
  UNIQUE (workflow_id),
  UNIQUE (user_id),
  FOREIGN KEY (workflow_id) REFERENCES workflows(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE workflows_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  workflow_id INT,
  user_id INT,
  UNIQUE (workflow_id),
  UNIQUE (user_id),
  FOREIGN KEY (workflow_id) REFERENCES workflows(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE driver_reports_workflow_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_report_id INT,
  workflow_id INT,
  UNIQUE (driver_report_id),
  UNIQUE (workflow_id),
  FOREIGN KEY (driver_report_id) REFERENCES driver_reports(id),
  FOREIGN KEY (workflow_id) REFERENCES workflows(id)
);

CREATE TABLE vehicle_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  driver_expense_rate FLOAT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE vehicle_types_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vehicle_type_id INT,
  user_id INT,
  FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE vehicle_types_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vehicle_type_id INT,
  user_id INT,
  FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE address_informations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  postal_code VARCHAR(255),
  address_line_1 VARCHAR(255),
  address_line_2 VARCHAR(255),
  latitude FLOAT,
  longitude FLOAT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE address_informations_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  user_id INT,
  UNIQUE (user_id),
  UNIQUE (address_information_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE address_informations_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  user_id INT,
  UNIQUE (user_id),
  UNIQUE (address_information_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE address_informations_country_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  administrative_unit_id INT,
  UNIQUE (address_information_id),
  UNIQUE (administrative_unit_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id)
);

CREATE TABLE address_informations_city_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  administrative_unit_id INT,
  UNIQUE (address_information_id),
  UNIQUE (administrative_unit_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id)
);

CREATE TABLE address_informations_district_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  administrative_unit_id INT,
  UNIQUE (address_information_id),
  UNIQUE (administrative_unit_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id)
);

CREATE TABLE address_informations_ward_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address_information_id INT,
  administrative_unit_id INT,
  UNIQUE (address_information_id),
  UNIQUE (administrative_unit_id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id)
);

CREATE TABLE organization_setting_extended (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  key VARCHAR(255) NOT NULL,
  value TEXT,
  description TEXT,
  value_type OrganizationSettingExtendedValueType DEFAULT 'STRING',
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE organization_settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  order_code_generation_type OrganizationSettingOrderCodeGenerationType,
  order_code_max_length INT,
  customer_code_prefix_max_length INT,
  route_code_prefix_max_length INT,
  min_bol_submit_days INT,
  min_vehicle_document_reminder_days INT,
  max_concurrent_deliveries INT,
  driver_inactivity_timeout INT,
  max_concurrent_eff_date DATETIME,
  show_salary_on_app BOOLEAN DEFAULT FALSE,
  auto_dispatch JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE driver_license_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE driver_license_types_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_license_type_id INT,
  user_id INT,
  FOREIGN KEY (driver_license_type_id) REFERENCES driver_license_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE driver_license_types_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_license_type_id INT,
  user_id INT,
  FOREIGN KEY (driver_license_type_id) REFERENCES driver_license_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE trailer_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE trailer_types_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  trailer_type_id INT,
  user_id INT,
  FOREIGN KEY (trailer_type_id) REFERENCES trailer_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE trailer_types_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  trailer_type_id INT,
  user_id INT,
  FOREIGN KEY (trailer_type_id) REFERENCES trailer_types(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_members (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone_number VARCHAR(255),
  description TEXT,
  is_admin BOOLEAN,
  is_linked BOOLEAN DEFAULT FALSE,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE organization_members_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_member_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (organization_member_id) REFERENCES organization_members(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_members_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_member_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (organization_member_id) REFERENCES organization_members(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_members_member_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_member_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (organization_member_id) REFERENCES organization_members(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_members_role_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_member_id INT NOT NULL,
  organization_role_id INT NOT NULL,
  FOREIGN KEY (organization_member_id) REFERENCES organization_members(id),
  FOREIGN KEY (organization_role_id) REFERENCES organization_roles(id)
);

CREATE TABLE organization_members_organization_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_member_id INT NOT NULL,
  organization_id INT NOT NULL,
  FOREIGN KEY (organization_member_id) REFERENCES organization_members(id),
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

CREATE TABLE organization_roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type OrganizationRoleType,
  name VARCHAR(255) NOT NULL,
  permissions JSON,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE custom_fields (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type CustomFieldType NOT NULL,
  data_type CustomFieldDataType NOT NULL,
  name VARCHAR(255) NOT NULL,
  key VARCHAR(255) NOT NULL,
  value TEXT,
  min INT DEFAULT 0,
  max INT DEFAULT 0,
  is_required BOOLEAN DEFAULT FALSE,
  validation_regex VARCHAR(255),
  description TEXT,
  display_order INT,
  is_active BOOLEAN DEFAULT TRUE,
  can_view_by_driver BOOLEAN,
  can_edit_by_driver BOOLEAN,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE bank_accounts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  account_number VARCHAR(255),
  holder_name VARCHAR(255),
  bank_name VARCHAR(255),
  bank_branch VARCHAR(255),
  description TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE bank_accounts_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  bank_account_id INT,
  user_id INT,
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE bank_accounts_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  bank_account_id INT,
  user_id INT,
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE vehicles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_type VehicleOwnerType NOT NULL,
  organization_id INT NOT NULL,
  subcontractor_id INT NOT NULL,
  vehicle_number VARCHAR(255) NOT NULL,
  id_number VARCHAR(255),
  type_id INT,
  brand VARCHAR(255),
  model VARCHAR(255),
  color VARCHAR(255),
  year_of_manufacture INT,
  fuel_type VehicleFuelType NOT NULL,
  start_usage_date DATETIME,
  max_length FLOAT,
  max_width FLOAT,
  max_height FLOAT,
  cubic_meter_capacity FLOAT,
  ton_payload_capacity FLOAT,
  pallet_capacity INT,
  registration_date DATETIME,
  registration_expiration_date DATETIME,
  technical_safety_registration_date DATETIME,
  technical_safety_expiration_date DATETIME,
  liability_insurance_registration_date DATETIME,
  liability_insurance_expiration_date DATETIME,
  driver_id INT,
  trailer_id INT,
  description TEXT,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  fuel_consumption FLOAT,
  registration_certificate_image_id INT,
  technical_safety_certificate_image_id INT,
  liability_insurance_certificate_image_id INT,
  meta JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (type_id) REFERENCES vehicle_types(id),
  FOREIGN KEY (driver_id) REFERENCES drivers(id),
  FOREIGN KEY (trailer_id) REFERENCES trailers(id),
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  FOREIGN KEY (subcontractor_id) REFERENCES subcontractors(id)
);

CREATE TABLE vehicle_trackings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  vehicle_id VARCHAR(255) UNIQUE NOT NULL,
  longitude FLOAT,
  latitude FLOAT,
  direction INT,
  speed FLOAT,
  address TEXT,
  car_status VehicleTrackingStatus,
  instant_fuel FLOAT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

CREATE TABLE vehicle_trackings_vehicle_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vehicle_tracking_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  FOREIGN KEY (vehicle_tracking_id) REFERENCES vehicle_trackings(id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

CREATE TABLE subcontractors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  code VARCHAR(255),
  name VARCHAR(255),
  tax_code VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  website VARCHAR(255),
  business_address TEXT,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  user_id INT,
  documents_id INT,
  bank_account_id INT,
  meta JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id),
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
);

CREATE TABLE drivers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATETIME,
  gender Gender NOT NULL,
  id_number VARCHAR(255),
  id_issue_date DATETIME,
  id_issued_by VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  address_information_id INT,
  license_type_id INT,
  license_number VARCHAR(255),
  license_issue_date DATETIME,
  license_expiry_date DATETIME,
  license_front_image_id INT,
  license_back_image_id INT,
  experience_years INT,
  basic_salary INT,
  contract_type DriverContractType,
  contract_start_date DATETIME,
  contract_end_date DATETIME,
  contract_document_ids INT,
  bank_account_id INT,
  meta JSON,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  is_owned_by_subcontractor BOOLEAN DEFAULT FALSE,
  user_id INT,
  union_dues FLOAT,
  security_deposit FLOAT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id),
  FOREIGN KEY (license_type_id) REFERENCES driver_license_types(id),
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE drivers_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  driver_id INT,
  user_id INT,
  FOREIGN KEY (driver_id) REFERENCES drivers(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  code VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  type CustomerType NOT NULL,
  tax_code VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  website VARCHAR(255),
  business_address TEXT,
  contact_name VARCHAR(255),
  contact_position VARCHAR(255),
  contact_email VARCHAR(255),
  contact_phone_number VARCHAR(255),
  meta JSON,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  import_driver VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

CREATE TABLE customers_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  user_id INT,
  UNIQUE (customer_id),
  UNIQUE (user_id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE customers_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  user_id INT,
  UNIQUE (customer_id),
  UNIQUE (user_id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE customers_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  user_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE customers_bank_account_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  bank_account_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
);

CREATE TABLE customers_default_unit_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  unit_of_measure_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (unit_of_measure_id) REFERENCES unit_of_measures(id)
);

CREATE TABLE resources (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  action VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE resources_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  resource_id INT,
  user_id INT,
  FOREIGN KEY (resource_id) REFERENCES resources(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE resources_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  resource_id INT,
  user_id INT,
  FOREIGN KEY (resource_id) REFERENCES resources(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE resources_operations_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  resource_id INT,
  operation_id INT,
  operation_order INT,
  FOREIGN KEY (resource_id) REFERENCES resources(id)
);

CREATE TABLE routes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  customer_id INT NOT NULL,
  type RouteType,
  code VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  distance INT,
  price INT,
  subcontractor_cost INT,
  driver_cost INT,
  bridge_toll INT,
  other_cost INT,
  min_bol_submit_days INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE routes_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_id INT,
  user_id INT,
  UNIQUE (route_id),
  UNIQUE (user_id),
  FOREIGN KEY (route_id) REFERENCES routes(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE routes_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_id INT,
  user_id INT,
  UNIQUE (route_id),
  UNIQUE (user_id),
  FOREIGN KEY (route_id) REFERENCES routes(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE route_points (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  code VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255) NOT NULL,
  contact_email VARCHAR(255) NOT NULL,
  contact_phone_number VARCHAR(255) NOT NULL,
  notes TEXT,
  display_order INT,
  pickup_times JSON,
  delivery_times JSON,
  requested_note TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE route_points_address_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_point_id INT,
  address_information_id INT,
  UNIQUE (route_point_id),
  UNIQUE (address_information_id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id),
  FOREIGN KEY (address_information_id) REFERENCES address_informations(id)
);

CREATE TABLE routes_pickup_points_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_id INT,
  route_point_id INT,
  route_point_order INT,
  UNIQUE (route_id),
  UNIQUE (route_point_id),
  FOREIGN KEY (route_id) REFERENCES routes(id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id)
);

CREATE TABLE routes_delivery_points_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_id INT,
  route_point_id INT,
  route_point_order INT,
  UNIQUE (route_id),
  UNIQUE (route_point_id),
  FOREIGN KEY (route_id) REFERENCES routes(id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id)
);

CREATE TABLE route_points_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_point_id INT,
  user_id INT,
  UNIQUE (route_point_id),
  UNIQUE (user_id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE route_points_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_point_id INT,
  user_id INT,
  UNIQUE (route_point_id),
  UNIQUE (user_id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE route_points_vehicle_types_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_point_id INT,
  vehicle_type_id INT,
  vehicle_type_order INT,
  FOREIGN KEY (route_point_id) REFERENCES route_points(id),
  FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id)
);

CREATE TABLE route_points_zone_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  route_point_id INT,
  zone_id INT,
  route_point_order INT,
  UNIQUE (route_point_id),
  UNIQUE (zone_id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id)
);

CREATE TABLE operations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  resource_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  action VARCHAR(255) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (resource_id) REFERENCES resources(id)
);

CREATE TABLE operations_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation_id INT,
  user_id INT,
  FOREIGN KEY (operation_id) REFERENCES operations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE operations_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operation_id INT,
  user_id INT,
  FOREIGN KEY (operation_id) REFERENCES operations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type OrderType,
  code VARCHAR(255) UNIQUE NOT NULL,
  order_date DATETIME NOT NULL,
  delivery_date DATETIME,
  weight INT,
  total_amount INT,
  merchandise_note TEXT,
  is_draft BOOLEAN DEFAULT TRUE,
  payment_due_date DATETIME,
  notes TEXT,
  last_status_type OrderStatusType,
  payment_date DATETIME,
  cbm FLOAT,
  meta JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  UNIQUE (code)
);

CREATE TABLE orders_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  user_id INT,
  UNIQUE (order_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE orders_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  user_id INT,
  UNIQUE (order_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE orders_customer_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  customer_id INT,
  UNIQUE (order_id),
  UNIQUE (customer_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE orders_participants_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  order_participant_id INT,
  order_participant_order INT,
  UNIQUE (order_id),
  UNIQUE (order_participant_id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE orders_merchandise_types_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  merchandise_type_id INT,
  merchandise_type_order INT,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (merchandise_type_id) REFERENCES merchandise_types(id)
);

CREATE TABLE orders_route_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  route_id INT,
  UNIQUE (order_id),
  UNIQUE (route_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (route_id) REFERENCES routes(id)
);

CREATE TABLE orders_unit_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  unit_of_measure_id INT,
  UNIQUE (order_id),
  UNIQUE (unit_of_measure_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (unit_of_measure_id) REFERENCES unit_of_measures(id)
);

CREATE TABLE order_route_statuses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  meta JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE order_route_statuses_order_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_route_status_id INT,
  order_id INT,
  order_route_status_order INT,
  FOREIGN KEY (order_route_status_id) REFERENCES order_route_statuses(id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_route_statuses_route_point_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_route_status_id INT,
  route_point_id INT,
  FOREIGN KEY (order_route_status_id) REFERENCES order_route_statuses(id),
  FOREIGN KEY (route_point_id) REFERENCES route_points(id)
);

CREATE TABLE order_route_statuses_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_route_status_id INT,
  user_id INT,
  FOREIGN KEY (order_route_status_id) REFERENCES order_route_statuses(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_route_statuses_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_route_status_id INT,
  user_id INT,
  FOREIGN KEY (order_route_status_id) REFERENCES order_route_statuses(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_statuses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type OrderStatusType NOT NULL,
  notes TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE access_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type AccessLogType DEFAULT 'ORDER',
  target_id INT NOT NULL,
  timestamp DATETIME NOT NULL,
  referrer_url VARCHAR(255),
  ip_address VARCHAR(255),
  user_agent VARCHAR(255),
  device_type VARCHAR(255),
  os VARCHAR(255),
  browser VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE access_logs_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  access_log_id INT,
  user_id INT,
  FOREIGN KEY (access_log_id) REFERENCES access_logs(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE share_objects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type ShareObjectType DEFAULT 'ORDER',
  target_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  shared_emails JSON,
  expiration_date DATETIME,
  meta JSON,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE share_objects_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  share_object_id INT,
  user_id INT,
  FOREIGN KEY (share_object_id) REFERENCES share_objects(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE share_objects_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  share_object_id INT,
  user_id INT,
  FOREIGN KEY (share_object_id) REFERENCES share_objects(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_statuses_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_status_id INT,
  user_id INT,
  UNIQUE (order_status_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_status_id) REFERENCES order_statuses(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_statuses_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_status_id INT,
  user_id INT,
  UNIQUE (order_status_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_status_id) REFERENCES order_statuses(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_statuses_order_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_status_id INT,
  order_id INT,
  order_status_order INT,
  UNIQUE (order_status_id),
  UNIQUE (order_id),
  FOREIGN KEY (order_status_id) REFERENCES order_statuses(id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  auto_activate_organization BOOLEAN DEFAULT FALSE,
  recipient_email VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  user_detail_id INT,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (user_detail_id) REFERENCES user_details(id)
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT,
  name VARCHAR(255) NOT NULL,
  package_weight INT,
  package_length INT,
  package_width INT,
  package_height INT,
  quantity INT,
  unit VARCHAR(255),
  notes TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME
);

CREATE TABLE order_items_merchandise_type_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_item_id INT,
  merchandise_type_id INT,
  FOREIGN KEY (order_item_id) REFERENCES order_items(id),
  FOREIGN KEY (merchandise_type_id) REFERENCES merchandise_types(id)
);

CREATE TABLE order_items_order_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_item_id INT,
  order_id INT,
  order_item_order INT,
  UNIQUE (order_item_id),
  UNIQUE (order_id),
  FOREIGN KEY (order_item_id) REFERENCES order_items(id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_participants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  order_id INT,
  role OrderParticipantRole,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_participants_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_participant_id INT,
  user_id INT,
  UNIQUE (order_participant_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_participant_id) REFERENCES order_participants(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_participants_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_participant_id INT,
  user_id INT,
  UNIQUE (order_participant_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_participant_id) REFERENCES order_participants(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE order_participants_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_participant_id INT,
  user_id INT,
  UNIQUE (order_participant_id),
  UNIQUE (user_id),
  FOREIGN KEY (order_participant_id) REFERENCES order_participants(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organizations_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT,
  user_id INT,
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organizations_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT,
  user_id INT,
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE smtp_settings_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  smtp_setting_id INT,
  user_id INT,
  FOREIGN KEY (smtp_setting_id) REFERENCES smtp_settings(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE smtp_settings_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  smtp_setting_id INT,
  user_id INT,
  FOREIGN KEY (smtp_setting_id) REFERENCES smtp_settings(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE organization_settings_smtp_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_setting_id INT,
  smtp_setting_id INT,
  FOREIGN KEY (organization_setting_id) REFERENCES organization_settings(id),
  FOREIGN KEY (smtp_setting_id) REFERENCES smtp_settings(id)
);

CREATE TABLE organizations_setting_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT,
  organization_setting_id INT,
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  FOREIGN KEY (organization_setting_id) REFERENCES organization_settings(id)
);

CREATE TABLE advances (
  id INT AUTO_INCREMENT PRIMARY KEY,
  organization_id INT NOT NULL,
  type AdvanceType DEFAULT 'DRIVER',
  advance_type AdvanceAdvanceType DEFAULT 'SALARY',
  amount FLOAT,
  approved_amount FLOAT,
  reason TEXT,
  status AdvanceStatus DEFAULT 'PENDING',
  payment_date DATETIME,
  rejection_reason TEXT,
  rejection_date DATETIME,
  description TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by_id INT,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  updated_by_id INT,
  published_at DATETIME,
  FOREIGN KEY (created_by_id) REFERENCES up_users(id),
  FOREIGN KEY (updated_by_id) REFERENCES up_users(id)
);

CREATE TABLE advances_created_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  advance_id INT,
  user_id INT,
  FOREIGN KEY (advance_id) REFERENCES advances(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE advances_updated_by_user_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  advance_id INT,
  user_id INT,
  FOREIGN KEY (advance_id) REFERENCES advances(id),
  FOREIGN KEY (user_id) REFERENCES up_users(id)
);

CREATE TABLE advances_driver_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  advance_id INT,
  driver_id INT,
  FOREIGN KEY (advance_id) REFERENCES advances(id),
  FOREIGN KEY (driver_id) REFERENCES drivers(id)
);