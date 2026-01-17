param location string = 'westeurope'


resource webapp 'Microsoft.Web/serverfarms@2024-11-01' = {
    name: 'myfirstwebapp'
    location: location
    sku: {
        name: 'B1'
    }
}
