#simple powershell to download LemonTreeComponents files from Nexus
$json = Invoke-RestMethod -Uri https://nexus.lieberlieber.com/service/rest/v1/components?repository=LemonTree.ArchiMate.Demo -Method Get
foreach ($url in $json.items.assets.downloadUrl) {
  $url = $url.Insert(4,"s")
  #$file = $url.Substring($url.lastIndexOf('/') + 1)
  $file = $url.Replace("https://nexus.lieberlieber.com/repository/LemonTree.ArchiMate.Demo/lemontree-component","").Replace("/","\") 
  $location = Get-Location 
  $absoluteFile = Join-Path -Path $location -ChildPath $file
  $absoluteDir = Split-Path -parent $absoluteFile 
 
  $extn = [IO.Path]::GetExtension($absoluteFile)
  if ($extn -eq ".mpms" )
  {
    Write-Host $absoluteDir
    Write-Host $absoluteFile
    Write-Host $url

    #if directory doesn't exist we have to create it.
    $foo = New-Item -ItemType Directory -Force -Path $absoluteDir

    $content = ((Invoke-RestMethod -Uri $url -Method Get) -replace "﻿")
    [IO.File]::WriteAllLines($absoluteFile, $content)
  }
  
}