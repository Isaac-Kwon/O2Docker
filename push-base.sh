#!/bin/bash

docker push isaackwon/o2docker:base-latest
docker tag isaackwon/o2docker:base-latest isaackwon/o2docker:base-$(date '+%Y-%m-%d')
docker push isaackwon/o2docker:base-$(date '+%Y-%m-%d')

