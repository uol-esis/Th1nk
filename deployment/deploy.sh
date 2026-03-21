#!/usr/bin/env bash

secured=false
echo "What type of demo do you want to deploy? Type 1 or 2"
select yn in "Default" "Secured"; do
  case $yn in
    Default ) break;;
    Secured ) secured=true; break;;
  esac
done

touch deployment/.env
echo "MB_GENERATED_KEY=<replace me>" >> deployment/.env
 
if [ "$secured" = true ]; then
  mkdir -p deployment/data/realms

  # download file from github.com/uol-esis/th1nk/blob/main/deployment/docker-compose-secured.yaml
  curl -o deployment/docker-compose.yaml https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/docker-compose-secured.yaml

  # download file for keycloak realm at github.com/uol-esis/th1nk/blob/main/deployment/data/realms/th1nk-realms.json
  curl -o deployment/data/realms/th1nk-realms.json https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/data/realms/th1nk-realms.json

  docker compose -f deployment/docker-compose.yaml up -d frontend db metabase keycloak

else
  echo "Please note that this startup does not secure the application. Please read the documentation for more information on how to secure your deployment."
  
  # download file from github.com/uol-esis/th1nk/blob/main/deployment/docker-compose.yaml
  curl -o deployment/docker-compose.yaml https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/docker-compose.yaml

  docker compose -f deployment/docker-compose.yaml up -d frontend db metabase
  
fi

echo "Please configure Metabase at http://localhost:3000. (Further information can be found in the documentation.)"
echo "Database configuration: https://www.metabase.com/docs/v0.57/databases/connections/postgresql.html. The DB credentials can be found in the backend/docker/docker-compose.yaml file."
echo "Type: postgres, Username: example, Password: example, Host: db, Port: 5432, Database name: th1nk, Schemas: all except th1-internal"
echo "Obtaining API key with Administrator permissions: https://www.metabase.com/docs/v0.57/people-and-groups/api-keys"
echo "Provide the obtained API key as an environment variable named MB_GENERATED_KEY via the '.env' file."
read -p "Press enter to continue after configuration"

docker compose -f deployment/docker-compose.yaml up -d backend

echo "Th1nk is now running. You can access the frontend at http://localhost"
echo "To stop the application, run 'docker compose -f deployment/docker-compose.yaml down'"
