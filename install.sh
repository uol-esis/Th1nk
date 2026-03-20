#!/usr/bin/env bash

docker compose -f backend/docker/docker-compose.yaml up -d frontend db metabase

echo "Please configure Metabase at http://localhost:3000. (Further information can be found in the documentation.)"
echo "Database configuration: https://www.metabase.com/docs/v0.57/databases/connections/postgresql.html. The DB credentials can be found in the backend/docker/docker-compose.yaml file."
echo "Type: postgres, Username: example, Password: example, Host: db, Port: 5432, Database name: th1nk, Schemas: all except th1-internal"
echo "Obtaining API key with Administrator permissions: https://www.metabase.com/docs/v0.57/people-and-groups/api-keys"
echo "Provide the obtained API key as an environment variable named METABASE_API_KEY."
read -p "Press enter to continue after configuration"

docker compose -f backend/docker/docker-compose.yaml up -d backend

echo "Th1nk is now running. You can access the frontend at http://localhost"
echo "To stop the application, run 'docker compose -f backend/docker/docker-compose.yaml down'"
echo "Please note that this startup does not secure the application. Please read the documentation for more information on how to secure your deployment."
