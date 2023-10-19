FROM jetty:9-alpine

USER root

RUN apk add --no-cache curl

ARG CERMINE_VERSION=1.13

RUN wget \
  --output-document $JETTY_BASE/webapps/cermine.war \
  https://maven.ceon.pl/artifactory/kdd-releases/pl/edu/icm/cermine/cermine-web/$CERMINE_VERSION/cermine-web-$CERMINE_VERSION.war

COPY healthcheck.sh .
USER jetty
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD ./healthcheck.sh
