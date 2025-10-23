# Data Stores

The service functions primarily as the Authentication and Authorization horizontal solution for all the DataGEMS services. The data it stores include realms and client configuration, user claims and user group management.

## Relational Database

The primary data store for the service is a PostgreSQL hosted relational database. 

The schema of the relational database is the one managed by the Keycloak solution.

## Updates

When updating the Keycloak service to newer versions, any needed database updates are handled by the migration process of Keycloak.
