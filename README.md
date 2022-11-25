# UNOFFICIAL Builder toolkit for LibreMetaverse

I needed something to build this content and extract them to a local directory. In no way is this project associated or endorsed by any third party, including but not limited to cinderblocks & LibreMetaverse contributors. I built this project out of my own interests and have received no assistance nor endorsement of any kind.

## Requirements
This was built off of some assumptions of the environment.

 - Windows 10 (at least Build 17063) [Reasoning HERE](https://techcommunity.microsoft.com/t5/containers/tar-and-curl-come-to-windows/ba-p/382409)
 - Powershell for Desktop (version: 5.x)
 - Windows Subsystem for Linux 2.0
 - Docker for Windows Desktop
 - at least 7 gb of RAM dedicated to WSL2.0

## How-to Basics
1. Ensure Docker for Desktop is running
2. Run the `Create-LibreMetaverse-Libraries.ps1` file
3. **Built files should be under `./libremetaverse-bin`**

## Credit

For the Powershell script and dockerfile, that credit goes to me, Liz "BlueDoge" Clements.

For the library, view it at [cinderblocks/libremetaverse](https://github.com/cinderblocks/libremetaverse) on GitHub!

## Licensing - LibreMetaverse
LibreMetaverse has its own license which can be viewed within the bin folders that get generated. Which is directly pulled from the repo as seen in the official libremetaverse repo. [LICENSE.txt](https://raw.githubusercontent.com/cinderblocks/libremetaverse/master/LICENSE.txt)

## Licensing - This Project
This project is MIT.
