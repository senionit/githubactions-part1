param location string = 'westeurope'


resource webapp 'Microsoft.Web/serverfarms@2024-11-01' = {
    name: 'myfirstwebapp'
    location: location
    sku: {
        name: 'B1'
    }
}

resource website 'Microsoft.Web/sites@2024-11-01' = {
    name:  'snieszwiec-fake-website-01'
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
