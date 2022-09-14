// Auto generated content, please customize files under provision folder

@secure()
param provisionParameters object
param provisionOutputs object
@secure()
param currentAppSettings object

var functionName = split(provisionOutputs.botFunctionOutput.value.resourceId, '/')[8]


var botAadAppClientId = provisionParameters['botAadAppClientId']
var botAadAppClientSecret = provisionParameters['botAadAppClientSecret']

resource botFunctionSettings 'Microsoft.Web/sites/config@2021-02-01' = {
  name: '${functionName}/appsettings'
  properties: union({
    BOT_ID: botAadAppClientId // ID of your bot
    BOT_PASSWORD: botAadAppClientSecret // Secret of your bot
    IDENTITY_ID: provisionOutputs.identityOutput.value.identityClientId // User assigned identity id, the identity is used to access other Azure resources
  }, currentAppSettings)
}
