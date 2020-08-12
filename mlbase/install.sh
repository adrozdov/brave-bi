#!/bin/bash

echo "Building image ..."
brave build

echo "Deploying unit ..."
brave deploy

echo "Bravetools info"
brave info
brave images
brave units