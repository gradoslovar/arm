Login-AzureRmAccount

$location = 'westeurope'
$rgName = 'AzureSQL'
   

New-AzureRmResourceGroup -Name $rgName -Location $location

Test-AzureRmResourceGroupDeployment -ResourceGroupName $rgName `
                                   -TemplateFile .\azuresql.json `
                                   -TemplateParameterFile .\azuresqlparameters.json `
                                   -Verbose

New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName `
                                   -TemplateFile .\azuresql.json `
                                   -TemplateParameterFile .\azuresqlparameters.json `
                                   -Verbose

