#!/bin/bash

SERVICE_ACCOUNT=${GCP_SERVICE_ACCOUNT:-gcp-service-account.json}

if ! [ -f ${SERVICE_ACCOUNT} ]
then
    echo "configuration file is not defined"
    exit 200
fi

if ! [ -d /workspace ]
then
    echo "/workspace dir is not mounted"
    exit 200
fi

# Activate service account through json file
gcloud auth activate-service-account --key-file=${SERVICE_ACCOUNT}

if [ "x${GCS_BUCKET_PATH}" = "x" ]
then
    echo "path to sync on localhost does not exist"
    exit 200
fi

#
# Continuous synchronization
#
while :; do
    echo "sync with GCS started"
    # Synchronize workspace stored in bucket to our local folder
    # and fix permissions (in case there were some issues)
    gsutil -q -m rsync -P -r gs://${GCS_BUCKET_PATH} /workspace/
    chown --recursive 33:33 /workspace/*

    echo "sync completed. wait 10 min until next sync"
    sleep 600
done
