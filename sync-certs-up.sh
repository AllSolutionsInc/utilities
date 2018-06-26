#!/bin/bash

readonly AWS_PROFILE=azhao
readonly CERTS_S3_BUCKET=azhao-certs

sudo aws s3 sync --profile $AWS_PROFILE /etc/letsencrypt/live s3://$CERTS_S3_BUCKET

echo Uploaded certs
