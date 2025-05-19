# Environment Configuration Guide

This document provides an overview of the different environment configurations available in the Transportation Management System (TMS) application.

## Available Environments

The application is configured to run in three different environments:

1. **Development (dev)** - For local development
2. **QA** - For testing and quality assurance
3. **Production (prod)** - For production deployment

## Environment-specific Configuration Files

Each environment has its own configuration file:

- `application.yml` - Contains the default configuration and development settings
- `application-qa.yml` - Contains QA-specific settings
- `application-prod.yml` - Contains production-specific settings

## Database Configuration

Each environment uses a different database configuration:

- **Development**: H2 in-memory database (for easy local development)
- **QA**: PostgreSQL database
- **Production**: PostgreSQL database (with enhanced connection pool settings)

## Security Configuration

JWT authentication is configured for all environments. The following files are required for JWT authentication:

- `app.pub` - Public key for JWT token verification
- `app.key` - Private key for JWT token signing

Keys for different environments can be generated using the provided scripts:

- Windows: `scripts/generate-jwt-keys.bat`
- Linux/Mac: `scripts/generate-jwt-keys.sh`

## Docker Configuration

Docker Compose files are provided for each environment:

- `docker/default/docker-compose.yml` - For development
- `docker/qa/docker-compose.yml` - For QA
- `docker/prod/docker-compose.yml` - For production

## How to Run

### Development Environment

```bash
# Using Maven
mvn spring-boot:run

# Using Docker
cd docker/default
docker-compose up -d
```

### QA Environment

```bash
# Using Maven
mvn spring-boot:run -Dspring.profiles.active=qa

# Using Docker
cd docker/qa
docker-compose up -d
```

### Production Environment

```bash
# Using Maven
mvn spring-boot:run -Dspring.profiles.active=prod

# Using Docker
cd docker/prod
docker-compose up -d
```

## Security Notes

For QA and Production environments, make sure to:

1. Generate new key pairs for JWT authentication
2. Place the keys in the appropriate `docker/{env}/config/security/` directory
3. Update database credentials to secure values
4. Never commit real production keys to version control
