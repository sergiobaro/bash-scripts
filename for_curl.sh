#!/bin/bash


major="15"

for minor in {1..18}; do
    version="${major}.${minor}.0"
    result=$(curl -s -H "X-Token: 1b5afdf9-a3ea-4073-8efb-0280896ad000" "https://api.evobanco.com:8443/evobanco/cms/semaphore/v1/app/version/info?os=ios&v=${version}")

    echo "VERSION: ${version}"
    echo "${result}" | python -m json.tool
done