FROM google/cloud-sdk:413.0.0-slim

WORKDIR /app

ENV GCP_SERVICE_ACCOUNT=
ENV GCS_BUCKET_PATH=

COPY entrypoint.sh .

ENTRYPOINT [ "/app/entrypoint.sh" ]
