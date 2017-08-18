$DeplymentName = "testDeploy"
$ResourceGroup = "test"
$ResourceGroupLocation = "westeurope"


New-AzureRmResourceGroup `
    -Name $ResourceGroup `
    -Location $ResourceGroupLocation

New-AzureRmResourceGroupDeployment `
    -Name $DeplymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile paas.json `
    -TemplateParameterFile paas.parameters.json `
    -Verbose -Force
    #@additionalParameters