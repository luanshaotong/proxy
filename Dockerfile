FROM percona/percona-server-mongodb-operator:1.14.0

USER root
RUN mv /ps-entry.sh /ps-entry-internal.sh
COPY ps-entry.sh init-entrypoint.sh tcpproxy /
USER 2
