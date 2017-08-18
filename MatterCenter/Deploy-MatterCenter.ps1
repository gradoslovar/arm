# parameters 
$rgName = "TrafficManagerWebApp"
$rgLocation = "West Europe"
$DeploymentName = "TMWebDeployment"

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
	-TemplateFile "$scriptDir\mc.json" -Verbose -Force
	#-TemplateParameterFile "$scriptDir\trafficmanager.parameters.json" `
	#@additionalParameters `
    #-Verbose -Force


#  display the end result
$x = Get-AzureRmTrafficManagerProfile -ResourceGroupName $rgName
$x
$x.Endpoints