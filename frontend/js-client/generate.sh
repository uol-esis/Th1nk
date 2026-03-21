UID=$(id -u)
GID=$(id -g)

docker run --rm \
  -u "${UID}":"${GID}" \
  -v "${PWD}":/local \
  -v "${PWD}/../../backend/openapi/openapi.yaml":/input/openapi.yaml \
   openapitools/openapi-generator-cli:v7.13.0 generate \
  -i /input/openapi.yaml \
  -g javascript \
  -t /local/templates \
  -o /local

docker run --rm \
  -u "${UID}":"${GID}" \
  -v "${PWD}":/local \
  node:lts-alpine \
  sh -c "cd /local && npm install && npm run build && npm pack"
