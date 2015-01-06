#!/bin/bash -eu

LOCUST_CMD="/usr/local/bin/locust"
LOCUST_OPTS="-f $SCENARIO_FILE"

if [ "$LOCUST_MODE" = "master" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --master"
elif [ "$LOCUST_MODE" = "slave" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --slave --master-host=$MASTER_HOST --host $TARGET_URL"
else
  LOCUST_OPTS="$LOCUST_OPTS --host $TARGET_URL"
fi

echo "=> Starting locust"
echo "$LOCUST_CMD $LOCUST_OPTS"

$LOCUST_CMD $LOCUST_OPTS
