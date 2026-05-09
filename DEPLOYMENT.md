# AgoraFlow Deployment Guide

## Overview
AgoraFlow is deployed on Google Cloud Platform using Cloud Run for the application and Cloud SQL for the database.

## Prerequisites
- Google Cloud Project with billing enabled
- Domain `ops.com` registered and configured
- GitHub repository with CI/CD pipeline

## GCP Services Used
- Cloud Run: Serverless container deployment
- Cloud SQL: PostgreSQL database
- Cloud Storage: File storage for Active Storage
- Cloud DNS: Domain management
- Secret Manager: Environment variables and secrets

## Environment Variables Required
Set these in GitHub Secrets or GCP Secret Manager:

### Database
- `DATABASE_URL`: PostgreSQL connection string for Cloud SQL

### Google Cloud
- `GCP_PROJECT_ID`: Google Cloud Project ID
- `GCP_SA_KEY`: Base64 encoded service account key JSON
- `GCS_BUCKET`: Cloud Storage bucket name
- `GCS_CREDENTIALS_JSON`: Base64 encoded GCS service account credentials

### Rails
- `RAILS_MASTER_KEY`: Rails master key for credentials
- `SECRET_KEY_BASE`: Rails secret key base

### Custom Domain
- `CUSTOM_DOMAIN`: Domain name (ops.com)

## Deployment Steps

### 1. Create GCP Project
```bash
gcloud projects create your-project-id
gcloud config set project your-project-id
```

### 2. Enable Required APIs
```bash
gcloud services enable run.googleapis.com
gcloud services enable sqladmin.googleapis.com
gcloud services enable storage.googleapis.com
gcloud services enable dns.googleapis.com
```

### 3. Create Cloud SQL Instance
```bash
gcloud sql instances create worldmaster-db \
  --database-version=POSTGRES_15 \
  --region=asia-northeast1 \
  --tier=db-f1-micro
```

### 4. Create Database
```bash
gcloud sql databases create worldmaster_production \
  --instance=worldmaster-db
```

### 5. Create Cloud Storage Bucket
```bash
gsutil mb -p your-project-id gs://worldmaster-storage
```

### 6. Create Service Account
```bash
gcloud iam service-accounts create worldmaster-sa \
  --description="Service account for AgoraFlow" \
  --display-name="AgoraFlow Service Account"
```

### 7. Grant Permissions
```bash
gcloud projects add-iam-policy-binding your-project-id \
  --member="serviceAccount:worldmaster-sa@your-project-id.iam.gserviceaccount.com" \
  --role="roles/cloudsql.client"

gcloud projects add-iam-policy-binding your-project-id \
  --member="serviceAccount:worldmaster-sa@your-project-id.iam.gserviceaccount.com" \
  --role="roles/storage.objectAdmin"
```

### 8. Create Service Account Key
```bash
gcloud iam service-accounts keys create key.json \
  --iam-account=worldmaster-sa@your-project-id.iam.gserviceaccount.com
```

### 9. Configure Domain (ops.com)
```bash
# Create Cloud DNS zone
gcloud dns managed-zones create ops-com-zone \
  --dns-name=ops.com. \
  --description="DNS zone for ops.com"

# Get nameservers
gcloud dns managed-zones describe ops-com-zone --format="value(nameServers)"
```

### 10. Update Domain Registrar
Update your domain registrar (ops.com) with the nameservers from step 9.

### 11. Deploy Application
Use the deploy script:
```bash
./bin/deploy-site
```

Or manually:
```bash
gcloud run deploy worldmaster \
  --source . \
  --platform managed \
  --region asia-northeast1 \
  --allow-unauthenticated \
  --set-env-vars RAILS_ENV=production \
  --port 3000
```

### 12. Map Custom Domain
```bash
gcloud run domain-mappings create \
  --service worldmaster \
  --domain ops.com \
  --region asia-northeast1
```

## Monitoring
- Cloud Run logs: `gcloud logging read "resource.type=cloud_run_revision AND resource.labels.service_name=worldmaster"`
- Database monitoring: GCP Console > SQL
- Storage monitoring: GCP Console > Storage

## Backup
- Database: Configure automated backups in Cloud SQL
- Files: Cloud Storage has built-in versioning

## Scaling
Cloud Run automatically scales based on traffic. Configure min/max instances as needed.