# push-bot
This action allows a specified user push to protected branches.

The user must have permissions to push to the branches.

## Inputs

| |||
| --- | --- | --- |
| token | **required** | The personal access token of the bot user
| branch_name | | The name of the protected branch. Defaults to `master`
| bot_name | **required** | The name of the bot user.

## Example usage
```
uses: colmose/push-bot@v1.0.0
with:
  token: 123abc456def
  branch_name: 'main'
  bot_name: 'admin-machine'
```
