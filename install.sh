#!/usr/bin/env bash

docker compose -f backend/docker/docker-compose.yaml up -d frontend db metabase

echo "Please configure Metabase at http://localhost:3000. (Further information can be found in the documentation.)"
read -p "Press enter to continue after configuration"

docker compose -f backend/docker/docker-compose.yaml up -d backend

echo "Th1nk is now running. You can access the frontend at http://localhost"
echo "To stop the application, run 'docker compose -f backend/docker/docker-compose.yaml down'"
echo "Please note that this startup does not secure the application. Please read the documentation for more information on how to secure your deployment."
