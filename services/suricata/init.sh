#!/bin/bash -x

# Define an array of Suricata rule sources to manage
sources=(
    "snort/community"
    "sslbl/ja3-fingerprints"
    "et/open"
    "oisf/trafficid"
    "etnetera/aggressive"
    "sslbl/ssl-fp-blacklist"
    "ptresearch/attackdetection"
)

# Loop through the sources and enable or add them if necessary
for source in "${sources[@]}"; do
    if ! suricata-update list-sources --enabled | grep "$source" > /dev/null; then
        if [[ "$source" == "snort/community" ]]; then
            echo "Adding $source rules"
            suricata-update add-source "$source" "https://www.snort.org/downloads/community/community-rules.tar.gz"
        else
            echo "Adding $source rules"
            suricata-update enable-source "$source"
        fi
    fi
done

# Update enabled sources
echo "Updating rules"
suricata-update update-sources
suricata-update --no-test
suricata-update list-enabled-sources

source ~/.bashrc
envsubst < /etc/suricata/suricata.yaml.tmpl > /etc/suricata/suricata.yaml

# Run the Suricata entry point
exec /bin/bash /docker-entrypoint.sh "$@" 

#source ~/.bashrc
#envsubst < /etc/suricata/suricata.yaml.tmpl > /etc/suricata/suricata.yaml

