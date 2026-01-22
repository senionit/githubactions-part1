param location string

@allowed(['prod','test'])
param environmentName string


resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' existing = {
    name: 'temporary-law'
    scope: resourceGroup(subscription().subscriptionId, 'rg-law')
}

resource appinsigths 'Microsoft.Insights/components@2020-02-02' = {
    name: 'fakeCompanyPortal-${environmentName}'
    location: location
    kind: 'web'
    properties: {
        Application_Type: 'web'
        WorkspaceResourceId: logAnalyticsWorkspace.id
    }
}
