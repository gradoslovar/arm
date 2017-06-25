### Define variables

$location = 'West Europe'
$resourceGroupName = 'NestedARM-VM'
$resourceDeploymentSolutionName = 'arm-nested-deployment'
$templateBaseUri = 'https://grenier.blob.core.windows.net/resources'
$templateFile = 'azureDeploy.json'
$template = $templateBaseUri + '/' + $templateFile
$templateParametersFile = 'azureDeploy.parameters.json'
$templateParameters = $templateBaseUri + '/' + $templateParametersFile


### Create Resource Group

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force


### Deploy IaaS Solution

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentSolutionName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $template `
    -TemplateParameterUri $templateParameters `
    -Verbose -Force