---
mode: "agent"
tools: ["codebase"]
description: "Generate configuration files for the Transportation Management System"
---

Your goal is to create or update configuration files for the Transportation Management System.

Ask for the configuration type (application properties, security, logging, etc.) if not provided.

Requirements:

- Create appropriate configuration files
- Follow Spring Boot configuration best practices
- Provide sample values for required properties
- Add detailed comments explaining each property
- Consider environment-specific configurations
- Include security-related configurations where needed
- Set up appropriate logging levels
- Configure database connection properties

Implementation guidelines:

- Use YAML or properties format as appropriate
- Organize properties logically by component
- Include placeholder values for sensitive information
- Consider using Spring profiles for environment-specific settings
- Add documentation references where applicable
- Follow naming conventions
- Include validation and constraints where possible
- Consider externalization of configuration
