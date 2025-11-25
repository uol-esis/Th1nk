UID=$(id -u)
GID=$(id -g)

docker run --rm \
  -u "${UID}":"${GID}" \
  -v "${PWD}":/local \
  -v "${PWD}/../../openapi/openapi.yaml":/input/openapi.yaml \
   openapitools/openapi-generator-cli:v7.13.0 generate \
  -i /input/openapi.yaml \
  -g javascript \
  -t /local/templates \
  -o /local
