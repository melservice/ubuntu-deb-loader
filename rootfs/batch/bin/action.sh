#!/bin/bash
#
# Der Start des Batches im Docker-Container

# Die Batch-Konfiguration einlesen
. /batch/bin/batchuser.properties

# Die deb-Pakete im Verzeichnis /batch/output/ aktualisieren
cat /batch/config/URL-*-Download.txt | sort -u | \
	while read url; do
		wget --timestamping --directory-prefix=/batch/output/ $url
	done

dpkg-scanpackages -m /batch/output/ /dev/null | sed '/^Depends:[[:space:]]*$/d' > /batch/output/Packages

exit 0;
