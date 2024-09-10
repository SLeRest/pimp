#!/bin/zsh

docker container exec db psql -h localhost -p 5432 -U nepsys -w -d thrasos -c ${1}
