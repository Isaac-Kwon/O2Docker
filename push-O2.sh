#!/bin/bash

docker push isaackwon/o2docker:o2-latest
docker tag isaackwon/o2docker:o2-latest isaackwon/o2docker:o2-$(date '+%Y-%m-%d')
docker push isaackwon/o2docker:o2-$(date '+%Y-%m-%d')

