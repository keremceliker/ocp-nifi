FROM redhat-openjdk-18/openjdk18-openshift
MAINTAINER green@redhat.com

ADD nifi-1.4.0 /home/jboss/

RUN ls -l /home/jboss

# We need to change file ownership in order to run with unprivileged
# owner.
USER root
RUN chown -R jboss:jboss /home/jboss
USER jboss

EXPOSE 8080

CMD /home/jboss/bin/nifi.sh run
