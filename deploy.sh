#!/bin/bash

# Deploy to Google Cloud Run
# This script is used by GitHub Actions

set -e

# Build the Docker image
gcloud builds submit --tag gcr.io/$GCP_PROJECT_ID/worldmaster

# Deploy to Cloud Run
gcloud run deploy worldmaster \
  --image gcr.io/$GCP_PROJECT_ID/worldmaster \
  --platform managed \
  --region asia-northeast1 \
  --allow-unauthenticated \
  --set-env-vars RAILS_ENV=production \
  --set-env-vars RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
  --set-env-vars DATABASE_URL=$DATABASE_URL \
  --set-env-vars GCP_PROJECT_ID=$GCP_PROJECT_ID \
  --port 3000

# Get the service URL
SERVICE_URL=$(gcloud run services describe worldmaster --region asia-northeast1 --format 'value(status.url)')

echo "Deployed to: $SERVICE_URL"

# Map custom domain (ops.com)
# Note: Domain verification and DNS setup required
gcloud run domain-mappings create \
  --service worldmaster \
  --domain ops.com \
  --region asia-northeast1

echo "Custom domain ops.com mapped to Cloud Run service"