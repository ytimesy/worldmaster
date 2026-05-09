# AgoraFlow Deployment Guide (Render)

## Overview
AgoraFlow is deployed on Render using free PostgreSQL and web services.

## Prerequisites
- Render account (https://render.com)
- GitHub repository: https://github.com/ytimesy/worldmaster
- Domain `ops.com` (optional for custom domain)

## Render Services Used
- Web Service: Ruby on Rails application
- PostgreSQL: Database (free tier)
- Custom Domain: ops.com (if configured)

## Automated Deployment with Blueprint

Render supports Blueprint deployment using `render.yaml`. This allows automatic service creation.

### Steps:
1. Go to https://render.com and sign in with GitHub
2. Click "New" → "Blueprint"
3. Connect your GitHub account and select repository `ytimesy/worldmaster`
4. Select branch `main`
5. Click "Apply" - this will create all services defined in `render.yaml`

The `render.yaml` file defines:
- PostgreSQL database (worldmaster-db)
- Web service (worldmaster) with build/start commands
- Automatic deploys from the `main` branch
- `DATABASE_URL` injection from the Render Postgres database
- Environment variables

## Manual Deployment Steps (if Blueprint doesn't work)

### 1. Create Render Account
Go to https://render.com and sign up/sign in.

### 2. Create PostgreSQL Database
1. Click "New" → "PostgreSQL"
2. Name: `worldmaster-db`
3. Database: `worldmaster_production`
4. Click "Create Database"
5. Note the connection string (DATABASE_URL)

### 3. Create Web Service
1. Click "New" → "Web Service"
2. Connect your GitHub account
3. Select repository: `ytimesy/worldmaster`
4. Configure:
   - Name: `worldmaster`
   - Runtime: `Ruby`
   - Branch: `main`
   - Auto-Deploy: `Yes`
   - Build Command: `./bin/render-build.sh`
   - Start Command: `bundle exec puma -C config/puma.rb`

### 4. Set Environment Variables
In the web service settings, add:

- `RAILS_ENV`: `production`
- `SECRET_KEY_BASE`: Generate with `bundle exec rails secret`
- `RAILS_MASTER_KEY`: Copy from `config/master.key`
- `DATABASE_URL`: From PostgreSQL service (auto-populated)

### 5. Deploy
Click "Create Web Service" to deploy.

### 6. Custom Domain (ops.com)
1. In web service dashboard, go to "Settings" → "Custom Domains"
2. Add domain: `ops.com`
3. Update DNS records as instructed:
   - Type: CNAME
   - Name: @
   - Value: [provided by Render]

## Default URL
After deployment, your app will be available at:
`https://worldmaster.onrender.com`

With custom domain: `https://ops.com`

## Monitoring
- Render Dashboard: View logs and metrics
- Database: PostgreSQL service in Render

## Updates
Push changes to GitHub main branch to auto-deploy.
If automatic deployment does not start after a push, check the web service's Settings page and make sure Auto-Deploy is enabled for the `main` branch.

## Free Tier Limits
- 750 hours/month
- 512 MB RAM
- 1 GB storage
