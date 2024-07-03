# Use the latest Suricata container image from jasonish/suricata
FROM jasonish/suricata:latest

# Install envsubst
RUN dnf install -y gettext

ENV COMMUNITY_ID=true
ENV SURICATA_INTERFACE=eth12
ENV SURICATA_HOME_NET=[172.26.14.76,172.26.0.91/20]

# Copy the initialization script (init.sh) into the image
COPY --chown=root:root ./suricata/init.sh /init.sh
COPY --chown=root:root ./suricata/config/suricata.yaml.tmpl /etc/suricata/suricata.yaml.tmpl
COPY --chown=root:root ./suricata/config/suricata.rules /var/lib/suricata/rules/suricata.rules
COPY --chown=root:root ./suricata/config/dos.rules /var/lib/suricata/rules/dos.rules
COPY --chown=root:root ./suricata/config/classification.config /var/lib/suricata/rules/classification.config

# Make the initialization script executable
RUN chmod +x /init.sh

# Set the initialization script as the entry point for the container
ENTRYPOINT ["/init.sh"]
