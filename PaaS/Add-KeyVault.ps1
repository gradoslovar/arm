$pfxFilePath = "C:\gradoslovar\arm\PaaS\deuxmoulins.pfx"
$pfxPassword = "Test123!"
$keyVaultName = "ARM"
$keyVaultSecretName = "testpfx"

$flag = [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::Exportable

$collection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection 
$collection.Import($pfxFilePath, $pfxPassword, $flag)

$pkcs12ContentType = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pkcs12 
$clearBytes = $collection.Export($pkcs12ContentType) 
$fileContentEncoded = [System.Convert]::ToBase64String($clearBytes) 
$secret = ConvertTo-SecureString -String $fileContentEncoded -AsPlainText –Force 
$secretContentType = 'application/x-pkcs12' 

Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name $keyVaultSecretName -SecretValue $Secret -ContentType $secretContentType


# 'Microsoft.Web' Resource Provider (RP) doesn't have access to the Key Vault by default, hence you need to authorize it
# This is a one time operation per subscription

Set-AzureRmKeyVaultAccessPolicy -VaultName $keyVaultName -ServicePrincipalName abfa0a7c-a6b6-4736-8310-5855508787cd -PermissionsToSecrets get 