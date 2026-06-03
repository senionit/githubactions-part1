# Short manual how to use and deploy files from this folder

1. Login into azure

```
az login
```


1. Deploy log analytics workspace

```
az deployment group create --resource-group rg-law --template-file architecture/loganalyticsworkspace.bicep
```

2. Deploy webapp with link to resources

```
az deployment group create --resource-group iaaclearning --parameters architecture/webapp.bicepparam
```
