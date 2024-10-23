#!/bin/bash
docker build -t dart-lambda .
docker create --name temp-container dart-lambda
mkdir -p output
docker cp temp-container:/var/runtime/bootstrap output/
docker rm temp-container
cd output && zip -j function.zip bootstrap && cd ..