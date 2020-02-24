#!/bin/bash
set -eu

cd /actions-runner
./config.sh --url $GHREPO --token $GHTOKEN
./run.sh
