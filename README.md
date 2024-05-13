# LemonTree.ArchiMate.Demo

## Introduction
This Repo is meant to show the capabilities you gain by using ArchiMate models on GitHub.
Sparx Systems Enterprise Architect with ArchiMate, LieberLieber LemonTree and Syntevo SmartGit are used to realize this.
GitHub Actions and LieberLieber LemonTree.Automation help to make the changes to the models easy to access via GitHub pull requests.

## Source 
This ArchiMate model was prepared by Chris Armstrong at [Armstrong Process Group, Inc.](https://www.aprocessgroup.com) https://www.aprocessgroup.com

## Preparation
To play with it you should Install: (in this order)

* [Sparx Systems Enterprise Architect 16 or 16.1](https://sparxsystems.com/)
* [Syntevo SmartGit](https://www.syntevo.com/smartgit/)
* [LieberLieber LemonTree](https://www.lieberlieber.com/lemontree/en/))

In case you fork it - you will need a License for LieberLieber LemonTree.Automation

## Nexus Artifact Storage
The files created by LemonTree.Automation are hosted on [http://nexus.lieberlieber.com/repository/LemonTree.ArchiMate.Demo/](https://nexus.lieberlieber.com/#browse/browse:LemonTree.ArchiMate.Demo)

## LemonTree Components are stored on Nexus
When a release is created in GitHub an Action autmatically publishes LemonTree Components to: 
[http://nexus.lieberlieber.com/repository/LemonTree.ArchiMate.Demo/](https://nexus.lieberlieber.com/#browse/browse:LemonTree.ArchiMate.Demo:lemontree-component)

To download use [DownloadComponents.ps1](https://github.com/LieberLieber/LemonTree.ArchiMate.Demo/blob/main/DownloadComponents.ps1)
 