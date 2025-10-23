# Logging

All DataGEMS services are producing logs in a structured way, usilizing common log formats. The logs are aggregated to the [Logging Service](https://datagems-eosc.github.io/dg-logging-service) where they can be queried and analyzed.

## Log format


## Troubleshooting Logs

Troubleshooting logs are produced by the service throughout the execution of caller requests. The logs produced by Keycloak do not follow the structured format and are indexed with their full payload without extracting additional properties.

## Accounting Logs

The service generates accounting entries that ustilize the same logging mechanism but are differentiated by troubleshooting logs sinve they are produced as events.

These event log entries are harvested and processed by the [Accounting Service](https://datagems-eosc.github.io/dg-accounting-service)

A prettyfied example of an event entry that corresponds to a client login event that can be injected as an accounting log entry is:
```json
{
	"@timestamp": "2025-10-23T11:02:01.575567055Z",
	"event.sequence": 20111,
	"log.logger": "org.keycloak.events",
	"log.level": "INFO",
	"message": "type=\"CLIENT_LOGIN\", realmId=\"0...2\", realmName=\"d...v\", clientId=\"d...i\", userId=\"d...b\", ipAddress=\"1...0\", token_id=\"t...d\", grant_type=\"c...s\", scope=\"p...l\", client_auth_method=\"client-secret\", username=\"s...i\", authSessionParentId=\"d...f\", authSessionTabId=\"9...Y\"",
	"process.thread.name": "executor-thread-1736",
	"process.thread.id": 3406,
	"mdc": {},
	"ndc": "",
	"host.hostname": "d...8",
	"process.name": "/u...a",
	"process.pid": 1,
	"ecs.version": "1...2",
	"data_stream.type": "logs",
	"service.name": "K...k",
	"service.version": "2...4",
	"service.environment": "p...d"
}
```

A prettyfied example of an event entry that corresponds to a user login event that can be injected as an accounting log entry is:
```json
{
	"@timestamp": "2025-10-23T11:10:45.439561499Z",
	"event.sequence": 20128,
	"log.logger": "org.keycloak.events",
	"log.level": "INFO",
	"message": "type=\"LOGIN\", realmId=\"0...2\", realmName=\"d...v\", clientId=\"d...i\", userId=\"1...1\", sessionId=\"d...2\", ipAddress=\"1...4\", auth_method=\"openid-connect\", token_id=\"o...4\", grant_type=\"password\", refresh_token_type=\"Refresh\", scope=\"p...l\", refresh_token_id=\"4...d\", client_auth_method=\"client-secret\", username=\"d...n\", authSessionParentId=\"d...2\", authSessionTabId=\"p...Y\"",
	"process.thread.name": "executor-thread-1743",
	"process.thread.id": 3413,
	"mdc": {},
	"ndc": "",
	"host.hostname": "d...8",
	"process.name": "/u...a",
	"process.pid": 1,
	"ecs.version": "1...2",
	"data_stream.type": "logs",
	"service.name": "K...k",
	"service.version": "2...4",
	"service.environment": "p...d"
}
```

### Accounting Events

The type of events that can be configured ass accountable types include, among others:

* Update consent error
* Update credential
* Impersonate
* Login
* User disabled by permanent lockout
* Token exchange
* Register
* Identity provider link account
* User disabled by temporary lockout
* Delete account
* Update profile
* Grant consent
* Client login
* Validate access token
* Logout
* Client register
* Refresh token
* Introspect token
* OAuth2 device authentication
* Execute action token
* Federated identity link
* Reset password
* Remove credential
* Update consent
* Code to token

