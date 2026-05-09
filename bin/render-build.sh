#!/bin/bash

# Render build script for AgoraFlow / WorldMaster

set -e

# Install dependencies
bundle install

# Run database migrations
bundle exec rails db:migrate

# Precompile assets
bundle exec rails assets:precompile

# Run database seed (optional)
bundle exec rails db:seed