#!/bin/bash

if [ ! -e .runner ]; then
    ./config.sh --url ${RUNNER_URL} --token ${RUNNER_TOKEN}
fi

./run.sh
