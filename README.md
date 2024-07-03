# suricata
https://www.kubelynx.com/article/detect-dos-attack-using-custom-rule-file-suricata

Clone the repo
$ git clone https://github.com/Dwijad/suricata/

Build Suricata
$ cd suricata
$ docker-compose build  --no-cache suricata

Deploy Suricata
$ docker-compose up -d suricata

Check logs
$ docker ps -a
$ docker logs -f <suricata_container_id_or_name>
