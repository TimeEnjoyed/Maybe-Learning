#!/bin/bash

# This is the command to launch the python and npm processes inside the container

cd twitch-plays-llm
npm start &

cd ..
. .venv/bin/activate
twitch-plays-llm run &

wait