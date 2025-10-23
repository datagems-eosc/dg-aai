# Api Overview

## Client Secret

A client registered in the DataGEMS AAI can request to be issued an access token by which it can authenticate its calls to other services. In order to do that, it needs to have the clientId and clientSecret that was assigned to it through the DataGEMS AAI registration of the client.

This authorization flow is called Client Credentials and is defined by the OIDC standard.

```console
curl --location 'https://<DATAGEMS_AAI_DOMAIN>/oauth/realms/<REALM>/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'client_id=<CLIENT_ID>' \
--data-urlencode 'client_secret=<CLIENT_SECRET>' \
--data-urlencode 'scope=<SCOPE>'
```

## User Password

A user registered in the DataGEMS AAI that can be authenticated with a username and password can request to issue an access token by which is can authenticate its calls to DataGEMS services. In order to do that, they need to have the username and password that was provided to the DataGEMS AAI registration of the user.

This authorization flow is called the Resource Owner Password Flow and is defined by the OIDC standard.

```console
curl --location 'https://<DATAGEMS_AAI_DOMAIN>/oauth/realms/<REALM>/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=<CLIENT_ID>' \
--data-urlencode 'username=<USERNAME>' \
--data-urlencode 'password=<USER_PASSWORD>' \
--data-urlencode 'scope=<SCOPE>'
```

This flow cannot be used with identity federation authentication flows. The code flow which is used to authenticate users in the DataGEMS platform through identity federation requires user interaction and redirects that cannot be demonstrated through a console curl example.

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

## Exchange Token

When a service receives a request but needs to invoke another service to complete the request, it must forward the credentials it was invoked with to continue the process flow under the scope of the original caller. But the received credential were intended for the usage of the first service and may not be accepted by the seconds service. For this reason, it must initiate a token exchange flow, presenting it's client id and secret so that the AAI service authorizes the client to exchange the requested token, along with the initial access token that needs to be exchanged and the desired scope of the new access token which will indicate the audience / reciever of the generated, exchanged credential. The genereted access token can then be used in the HTTP request as a Bearer token in the Authorization header.

This authorization flow is called the Token Exchange Flow and is defined by the OIDC standard.

```console
curl --location 'https://<DATAGEMS_AAI_DOMAIN>/oauth/realms/<REALM>/protocol/openid-connect/token' \
--header 'Authorization: Basic <BASE64(CLIENT_ID:CLIENT_SECRET)>' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=urn:ietf:params:oauth:grant-type:token-exchange' \
--data-urlencode 'subject_token=ey...p2g' \
--data-urlencode 'subject_token_type=urn:ietf:params:oauth:token-type:access_token' \
--data-urlencode 'requested_token_type=urn:ietf:params:oauth:token-type:access_token' \
--data-urlencode 'scope=<SCOPE>'
```
