# parameters 
$rgName = "MatterCenter"
$rgLocation = "West Europe"
$DeploymentName = "MatterCenterDeployment"

# import the AzureRM modules
#Import-Module AzureRM.TrafficManager
#Import-Module AzureRM.Resources

#  login
# Login-AzureRmAccount

# create the resource from the template - pass names as parameters
$scriptDir = Split-Path $MyInvocation.MyCommand.Path

New-AzureRmResourceGroup -Location $rgLocation `
                         -Name $rgName `
                         -Force -Verbose

New-AzureRmResourceGroupDeployment `
	-Name $DeploymentName `
	-ResourceGroupName $rgName `
    -TemplateFile "$scriptDir\mc.json" `
    -TemplateParameterFile "$scriptDir\mc.parameters.json" `
    -Verbose -Force
    #@additionalParameters


#  display the end result

$x = Get-AzureRmTrafficManagerProfile -ResourceGroupName $rgName
$x
$x.Endpoints