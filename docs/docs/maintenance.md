# Maintenance

The service is part of the DataGEMS platform offered through an existing deployment, following the DataGEMS release and deployment procedures over a managed infrasrtucture along with the maintenance activities that are scheduled within the platform. The purpose of this section is not to detail the maintenance activities put in place by the DataGEMS team.

## Healthchecks

The service [observability documentation](https://www.keycloak.org/observability/health) describes healthcheck endpoints that can be used to track the status of the service. 

An example of a healthcheck response that returns 200 OK for healthy state is:
```json
{
    "status": "UP",
    "checks": [
        {
            "name": "Keycloak cluster health check",
            "status": "UP"
        },
        {
            "name": "Keycloak database connections async health check",
            "status": "UP"
        }
    ]
}
```

## Verions & Updates

The service follows the versioning and update scheme that Keycloak supports.

## Backups

All state persisted by the service is maintained in the relational database as described in the respective [datastores](datastore.md) section.

To keep backups of the state, the respective utilities must be scheduled to run in a consistent manner. 

## Troubleshooting

Troubleshooting is primarily done through the logging mechanisms that are available and are described in the respective [logging](logging.md) section.