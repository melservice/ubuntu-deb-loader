#!/bin/bash
#
# Initialisierung des Service beim Erstellen des Images

# Die Batch-Konfiguration einlesen
BatchProperties="/batch/bin/batchuser.properties";
if [ -r $BatchProperties ]; then
	. $BatchProperties
fi;

# -----------------------------------------------------------------------------

# Die benötigten pakete installieren
/docker/init/aptInstall.sh wget dpkg-dev cifs-utils
