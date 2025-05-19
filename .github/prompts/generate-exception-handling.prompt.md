---
mode: "agent"
tools: ["codebase"]
description: "Generate exception handling for the Transportation Management System"
---

Your goal is to create a comprehensive exception handling strategy for the Transportation Management System.

Ask for specific requirements if not provided.

Requirements:

- Create custom exception classes for different error scenarios
- Implement global exception handling with @ControllerAdvice
- Define meaningful error response structure
- Add proper logging for exceptions
- Map exceptions to appropriate HTTP status codes
- Handle both technical and business exceptions
- Include internationalization support for error messages
- Add validation error handling

Implementation guidelines:

- Create a base exception class for the application
- Implement specific exception types (ResourceNotFoundException, ValidationException, etc.)
- Create an ErrorResponse DTO class
- Implement a global exception handler
- Configure logging levels appropriately
- Add exception documentation
- Consider security implications (avoid leaking sensitive information in error messages)
- Add support for error codes
