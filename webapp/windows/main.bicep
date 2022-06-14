param location string = resourceGroup().location

param tags string
param webappname string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: webappname
  location: location
  kind: 'windows'
  tags: {
    tagName1: tags
  }
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: webappname
  location: location
  tags: {
    tagName1: tags
   }

  properties: {
    serverFarmId: appServicePlan.id
    enabled: true
    siteConfig: {
    metadata: [
      {
        name: 'CURRENT_STACK'
        value: 'dotnet'
      }
    ]
    alwaysOn: false
    netFrameworkVersion: 'v4.0'
    use32BitWorkerProcess: true
    webSocketsEnabled: true
    }
  }
}
