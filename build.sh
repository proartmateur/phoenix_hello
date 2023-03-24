#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Elixit v:"
echo elixir --version

mix setup

# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
#npm install --prefix ./assets
#npm run deploy --prefix ./assets
#mix phx.digest

# Compile assets
MIX_ENV=prod mix assets.deploy

# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite