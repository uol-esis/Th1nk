#!/bin/sh

if ! command -v curl >/dev/null 2>&1
then
    echo "curl could not be found" >&2
    exit 1
fi

if ! command -v docker >/dev/null 2>&1
then
    echo "docker could not be found" >&2
    exit 1
fi
if ! command -v docker >/dev/null 2>&1 || ! docker compose version >/dev/null 2>&1
then
    echo "Error: 'docker compose' is not available" >&2
    echo "Please install Docker with compose plugin" >&2
    exit 1
fi


secured=false
echo "What type of demo do you want to deploy? Type 1 or 2"
echo "1) Default"
echo "2) Secured"
read -r choice

case "$choice" in
    1)
        ;;
    2)
        secured=true
        ;;
    *)
        echo "Invalid choice, defaulting to Default"
        ;;
esac

touch .env
echo "MB_GENERATED_KEY=<replace me>" >> .env

if [ "$secured" = true ]; then
    mkdir -p data/realms

    # download file from github.com/uol-esis/th1nk/blob/main/deployment/docker-compose-secured.yaml
    curl -o docker-compose.yaml https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/docker-compose-secured.yaml

    # download file for keycloak realm at github.com/uol-esis/th1nk/blob/main/deployment/data/realms/th1nk-realms.json
    curl -o data/realms/th1nk-realms.json https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/data/realms/th1nk-realms.json

    docker compose up -d frontend db metabase keycloak
else
    echo "Please note that this startup does not secure the application. Please read the documentation for more information on how to secure your deployment."

    # download file from github.com/uol-esis/th1nk/blob/main/deployment/docker-compose.yaml
    curl -o docker-compose.yaml https://raw.githubusercontent.com/uol-esis/th1nk/main/deployment/docker-compose.yaml

    docker compose up -d frontend db metabase
fi

echo "Please configure Metabase at http://localhost:3000. (Further information can be found in the documentation.)"
echo "Database configuration: https://www.metabase.com/docs/v0.57/databases/connections/postgresql.html. The DB credentials can be found in the backend/docker/docker-compose.yaml file."
echo "Type: postgres, Username: example, Password: example, Host: db, Port: 5432, Database name: th1nk, Schemas: all except th1-internal"
echo "Obtaining API key with Administrator permissions: https://www.metabase.com/docs/v0.57/people-and-groups/api-keys"
echo "Provide the obtained API key as an environment variable named MB_GENERATED_KEY via the '.env' file."
echo "Press enter to continue after configuration"
read -r dummy

docker compose up -d backend

echo "Th1nk is now running. You can access the frontend at http://localhost"
echo "To stop the application, run 'docker compose down'"