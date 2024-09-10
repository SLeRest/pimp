#!/bin/zsh

docker exec -it -u $PROJECT db psql -U $PROJECT $PROJECT
