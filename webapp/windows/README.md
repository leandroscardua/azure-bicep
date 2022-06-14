# Deploy to azure

az group create --name {{ enter name }} --location {{ enter location }}

az deployment group create --resource-group webapp_test2 --template-file main.bicep --parameters webappname={{ enter name }} tags={{ enter tag }}
