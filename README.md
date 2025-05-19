# Transportation Management System (TMS)

A Spring Boot application for managing transportation operations including users, routes, vehicles, and scheduling.

## Features

- User management
- Vehicle tracking and management
- Route planning and optimization
- Trip scheduling
- Maintenance tracking
- Reporting and analytics

## Technology Stack

- Java 21
- Spring Boot 3.4.5
- Spring Data JPA
- H2 Database (for development)
- RESTful API
- Maven for dependency management

## Getting Started

### Prerequisites

- JDK 21
- Maven 3.8+

### Installation

1. Clone the repository

```bash
git clone https://github.com/yourusername/auto-tms.git
cd auto-tms
```

2. Build the project

```bash
./mvnw clean install
```

3. Run the application

```bash
./mvnw spring-boot:run
```

The application will be available at http://localhost:8080

## API Documentation

API documentation is available via Swagger UI at http://localhost:8080/swagger-ui.html when the application is running.

## Development

### Database

The application uses H2 in-memory database by default. The H2 console is available at http://localhost:8080/h2-console with these default settings:

- JDBC URL: `jdbc:h2:mem:tmsdb`
- Username: `sa`
- Password: (leave empty)

### GitHub Copilot Prompts

This project includes several GitHub Copilot prompts to assist with development:

- `generate-controller.prompt.md`: Generate REST controllers
- `generate-entity.prompt.md`: Generate JPA entities
- `generate-service.prompt.md`: Generate service components
- `generate-repository.prompt.md`: Generate repositories
- `generate-dto.prompt.md`: Generate DTOs
- `generate-tests.prompt.md`: Generate unit and integration tests
- `generate-db-migration.prompt.md`: Generate database migrations
- `generate-configuration.prompt.md`: Generate configuration files
- `generate-exception-handling.prompt.md`: Generate exception handling code

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
