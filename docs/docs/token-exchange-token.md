# Api Examples

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
