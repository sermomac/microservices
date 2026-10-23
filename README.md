# Microservices Architecture

A Java and Spring Boot microservices project demonstrating distributed application design, inter-service communication, authentication, event-driven messaging, and database integration.

## 📋 Overview

This project demonstrates how to build a microservices-based application using Java, Spring Boot, PostgreSQL, Apache Kafka, and gRPC.

The application is divided into independent services, each responsible for a specific business capability. Services communicate through APIs and asynchronous messaging to support a modular and scalable architecture.

## 🏗️ Architecture

The repository contains the following services and supporting components:

| Component                       | Description                                          |
| ------------------------------- | ---------------------------------------------------- |
| `api-gateway`                   | Entry point for routing requests to backend services |
| `auth-service`                  | Authentication and security                          |
| `patient-service`               | Patient management and related operations            |
| `billing-service`               | Billing functionality and gRPC communication         |
| `analytics-service`             | Analytics-related processing                         |
| `infrastructure`                | Infrastructure and service configuration             |
| `integration-tests`             | Integration testing                                  |
| `api-requests`                  | API request examples                                 |
| `grpc-requests/billing-service` | gRPC request examples                                |

## 🛠️ Tech Stack

- **Java** — Programming language
- **Spring Boot** — Microservices framework
- **Spring Security** — Authentication and security
- **Spring Data JPA / Hibernate** — Data persistence
- **PostgreSQL** — Relational database
- **Apache Kafka** — Event-driven messaging
- **gRPC** — Inter-service communication
- **Protocol Buffers** — Service contract definitions
- **Maven** — Dependency management and builds
- **Docker** — Containerized infrastructure, where configured

## 📁 Project Structure

```text
microservices/
├── analytics-service/
├── api-gateway/
├── api-requests/
├── auth-service/
├── billing-service/
├── grpc-requests/
│   └── billing-service/
├── infrastructure/
├── integration-tests/
├── patient-service/
├── .gitignore
└── README.md
```

## 🚀 Getting Started

### Prerequisites

Install the following tools:

- Git
- Java JDK compatible with the project configuration
- Apache Maven, or the included Maven wrapper
- Docker and Docker Compose, if required by the infrastructure setup

### 1. Clone the Repository

```bash
git clone https://github.com/sermomac/microservices.git
cd microservices
```

### 2. Configure Environment Variables

The patient service uses configuration variables such as:

```dotenv
SPRING_DATASOURCE_URL=jdbc:postgresql://patient-service-db:5432/db
SPRING_DATASOURCE_USERNAME=admin_user
SPRING_DATASOURCE_PASSWORD=password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_KAFKA_BOOTSTRAP_SERVERS=kafka:9092
SPRING_SQL_INIT_MODE=always
```

The authentication service uses similar database settings:

```dotenv
SPRING_DATASOURCE_URL=jdbc:postgresql://auth-service-db:5432/db
SPRING_DATASOURCE_USERNAME=admin_user
SPRING_DATASOURCE_PASSWORD=password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_SQL_INIT_MODE=always
```

These values are examples for local development. Use the configuration files in each service to determine the required variables and actual database settings.

**Security:** Do not use example passwords in production or commit real credentials to the repository.

### 3. Start Infrastructure

Check the `infrastructure/` directory for the project's Docker Compose and infrastructure configuration.

If a Compose file is available, start the configured services with:

```bash
docker compose up -d
```

If the Compose file is located in a subdirectory, specify its path using `-f`.

Ensure PostgreSQL and Kafka are available before starting services that depend on them.

### 4. Build and Run Services

Each service should be built and run according to its Maven configuration.

For example, to build the authentication service:

```bash
cd auth-service
mvn clean package
```

Run the generated executable JAR:

```bash
java -jar target/*.jar
```

Repeat the process for the other services, making sure their dependencies and environment variables are configured.

If a Maven wrapper is provided, you can use `./mvnw` on Linux/macOS or `mvnw.cmd` on Windows instead of installing Maven globally.

> Note: The exact startup order, ports, and commands depend on each service's configuration and the infrastructure setup.

## 🔄 Communication Patterns

### REST APIs

The API gateway provides a centralized entry point for routing client requests to the appropriate backend services.

### gRPC

The billing service includes gRPC integration using Protocol Buffers. This enables strongly typed service contracts and efficient communication between services.

### Apache Kafka

Kafka provides asynchronous messaging capabilities, allowing services to exchange events without requiring all operations to complete synchronously.

## 🗄️ Database

PostgreSQL is used for relational persistence.

Database configuration is managed through service-specific environment variables and Spring Boot configuration files.

Hibernate and SQL initialization settings should be reviewed before running the application against an existing or production database.

## 🧪 Testing

The repository includes an `integration-tests/` directory.

Run tests for an individual Maven-based service with:

```bash
cd auth-service
mvn test
```

For integration tests, start any required infrastructure and review the test module's Maven configuration for the appropriate command.

## 👨‍💻 Development Workflow

1. Clone the repository.
2. Configure the required environment variables.
3. Start the supporting infrastructure.
4. Build and start the required services.
5. Test API endpoints and inter-service communication.
6. Run the available automated tests.
7. Submit changes through a feature branch and pull request.

## 🤝 Contributing

Contributions, bug reports, and suggestions are welcome.

1. Fork the repository.
2. Create a feature branch:

   ```bash
   git checkout -b feature/your-feature
   ```

3. Implement your changes and add tests.
4. Commit your changes:

   ```bash
   git commit -m "Describe your changes"
   ```

5. Push your branch and open a pull request.

## 📚 Resources

- **Repository:** https://github.com/sermomac/microservices

## 📄 License

Refer to the repository's license information for the applicable terms of use.

---

Built with Java, Spring Boot, and microservices architecture concepts.
