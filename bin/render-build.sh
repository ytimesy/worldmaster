#!/bin/bash

# Render build script for AgoraFlow / WorldMaster

set -e

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile
