#!/bin/sh
set -e

deploy_webhook () {
    curl \
        --fail \
        --silent \
        --show-error \
        --max-time 5 \
        --connect-timeout 5 \
        --user-agent "ploi-deploy-action-webhook" \
        --request 'POST' \
        "$WEBHOOK_URL"
}

deploy_api () {
    curl \
        --fail \
        --silent \
        --show-error \
        --max-time 5 \
        --connect-timeout 5 \
        --user-agent "ploi-deploy-action-api" \
        --request 'POST' \
        -H "Authorization: Bearer $API_TOKEN" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        "https://ploi.io/api/servers/$SERVER_ID/sites/$SITE_ID/deploy"
}

if [ -n "$WEBHOOK_URL" ]; then
    deploy_webhook
elif [ -n "$API_TOKEN" ]; then
    if [ -z "$SERVER_ID" ] || [ -z "$SITE_ID" ]; then
        echo "SERVER_ID or SITE_ID environment variable is not set, exiting..."
        exit 1
    fi
    deploy_api
else
    echo "WEBHOOK_URL or API_TOKEN environment variable is not set, exiting..."
    exit 1
fi
