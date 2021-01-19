# Ploi Deploy Action

Deploy your application to Ploi with Github actions.
This action currently uses the `Deploy webhook URL` found in the site repository tab.

## Inputs

### `webhook_url`

**Required** Deploy webhook URL.
_It is advised to use Github secrets to keep your webhook URL private._

## Example usage

```yaml
uses: Glennmen/ploi-deploy-action@v1
with:
  webhook_url: ${{ secrets.WEBHOOK_URL }}
```

## Example workflows

You can find some common workflows in the [example's directory](examples/README.md).

## Future updates

* Add API based deploy
    * Flush FastCGI cache
    * Restart daemon
    * Restart service
    * Refresh OPCache

Other suggestions are welcome, please make an issue.
