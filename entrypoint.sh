#!/bin/sh
# Auth
echo "$INPUT_SECRETS" > /secrets.json
gcloud auth activate-service-account --key-file=/secrets.json
rm /secrets.json

# Sync files to bucket
echo "Syncing bucket $INPUT_BUCKET ..."
gsutil -m rsync -r -c -d -x "$INPUT_EXCLUDE" /github/workspace/$INPUT_SUBDIRECTORY gs://$INPUT_BUCKET/
echo "Done."
