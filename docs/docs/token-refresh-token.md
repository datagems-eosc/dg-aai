# Api Examples

## Refresh Token

When an access token is generated, the access token is short lived and a refresh token is generated with it with larger lifetime. The authenticated party can use the refresh token to issue new access token. When the refresh token expires, it needs to issue a new authentication request.

This authorization flow is called the Refresh Token Flow and is defined by the OIDC standard.

```console
curl --location 'https://<DATAGEMS_AAI_DOMAIN>/oauth/realms/<REALM>/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=refresh_token' \
--data-urlencode 'client_id=<CLIENT_ID>' \
--data-urlencode 'refresh_token=eyJ...GA'
```
