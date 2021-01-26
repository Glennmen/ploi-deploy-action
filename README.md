# Ploi Deploy Action

Deploy your application to Ploi with Github actions.
This action currently uses the `Deploy webhook URL` found in the site repository tab.

## Inputs

### `webhook_url`

**Required** Deploy webhook URL.
_It is advised to use Github secrets to keep your webhook URL private._

The webhook url can be found in your sites Settings tab.

## Basic workflow

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
        uses: Glennmen/ploi-deploy-action@v1.1.0
        with:
          webhook_url: ${{ secrets.WEBHOOK_URL }}
```

## Advanced workflows

You can find some common workflows in the [example's directory](examples/README.md).

## Future updates

* Add API based deploy
  * Flush FastCGI cache
  * Restart daemon
  * Restart service
  * Refresh OPCache

Other suggestions are welcome, please make an issue.
