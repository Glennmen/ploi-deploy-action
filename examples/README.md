# Example workflows

## Deploy on push
A [basic workflow](deploy-on-push.yml) similar to default Ploi deploy behaviour.

Triggers a deployment on every push to the master branch.

## Deploy when new release is published
If you only want to deploy when a new Github release version has been published check out this [workflow example](deploy-on-new-release.yml).

## Deploy if commit message contains `[Release]`
[This workflow](deploy-if-message-contains.yml) is a little more advanced it will only run this workflow if the commit message contains `[Release]` and skip in all other cases. 

## Deploy on tests success
By default, Github actions will only execute a step if all previous steps succeed, this make it ideal to use a deployment step after running your tests.

In [this workflow](deploy-on-tests-success.yml) you can build and run tests, and the deployment will only be triggered if all previous steps go through without any errors.
