param location string = 'westeurope'

@allowed(['test', 'prod'])
param environmentName string

resource webapp 'Microsoft.Web/serverfarms@2024-11-01' = {
    name: 'myfirstwebapp-${environmentName}'
    location: location
    sku: {
        name: 'B1'
    }
}

resource website 'Microsoft.Web/sites@2024-11-01' = {
    name:  'snieszwiec-fake-website-01-${environmentName}'
    location: location
    dependsOn: [
        webapp
    ]
    properties: {
         serverFarmId: webapp.id
    }
}

resource websettings 'Microsoft.Web/sites/config@2025-03-01' = {
    name:  'appsettings'
    parent: website
    properties: {
        enableAwsomeFeature: true
    }
}

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
