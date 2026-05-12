FROM quay.io/keycloak/keycloak:26.3.3

USER root

COPY datagems-theme /opt/keycloak/themes/datagems-theme

RUN chown -R keycloak:0 /opt/keycloak/themes/datagems-theme

USER keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
