#!/bin/bash
while [ ! -f "/opt/apacheds/instances/${INSTANCE}/conf/config.ldif" ] && [ ! -f "/opt/apacheds/instances/${INSTANCE}/conf/config.ldif_migrated" ]; do
	echo "Searching configuration"
	sleep 10s;
done
/opt/apacheds/bin/apacheds.sh $INSTANCE run
