# Ploi Deploy Action

Deploy your application to Ploi with Github actions.
This action supports both the `Deploy webhook URL` found in the site repository tab and API based deployment.

## Inputs

### Webhook deployment

#### `webhook_url`

**Required** Deploy webhook URL.
_It is advised to use Github secrets to keep your webhook URL private._

The webhook url can be found in your sites Repository tab.

### API deployment

#### `api_token`

**Required** Ploi API token.
_It is advised to use Github secrets to keep your API token private._

The API token can be found in Profile -> API keys.

#### `server_id`

**Required** Ploi Server ID.

Server ID can be found in your servers Settings tab.

#### `site_id`

**Required** Ploi Site ID.

Site ID can be found in your sites Settings tab.

## Basic workflows

### Webhook deployment

```yaml
name: 'Deploy on push'

on:
  push:
    branches:
      - master

jobs:
  ploi-deploy:
    name: 'Ploi Deploy'
    runs-on: ubuntu-latest

    steps:
      # Checkout the repository to the GitHub Actions runner
      - name: Checkout
        uses: actions/checkout@v2

      # Trigger Ploi deploy webhook
      - name: Deploy
        uses: Glennmen/ploi-deploy-action@v1.2.0
        with:
          webhook_url: ${{ secrets.WEBHOOK_URL }}
```

### API deployment

```yaml
name: 'Deploy on push'

on:
  push:
    branches:
      - master

jobs:
  ploi-deploy:
    name: 'Ploi Deploy'
    runs-on: ubuntu-latest

    steps:
      # Checkout the repository to the GitHub Actions runner
      - name: Checkout
        uses: actions/checkout@v2

      # Trigger Ploi deploy api
      - name: Deploy
        uses: Glennmen/ploi-deploy-action@v1.2.0
        with:
          api_token: ${{ secrets.API_TOKEN }}
          server_id: 1
          site_id: 1
```

## Advanced workflows

You can find some common workflows in the [example's directory](examples/README.md).

## Future updates

* ~~Add API based deploy~~
  * Flush FastCGI cache
  * Restart daemon
  * Restart service
  * Refresh OPCache

Other suggestions are welcome, please make an issue.
