#Created by Liz "BlueDoge" Clements

$workingPath = (Get-Location).Path

Invoke-Expression -Command 'docker build -t libremetaverse-for-bluedogebot -f libremetaverse-libraries.Dockerfile .' -ErrorAction SilentlyContinue

Invoke-Expression -Command 'docker run --name="libremetaverse-builder-for-bluedogebot" libremetaverse-for-bluedogebot' -ErrorAction SilentlyContinue

$binPath = ($workingPath + "\libremetaverse-bin")

If(!(Test-Path -PathType Container $binPath))
{
    New-Item -ItemType Directory -Path $binPath
    New-Item -ItemType Directory -Path ($binPath + '\Release')
    New-Item -ItemType Directory -Path ($binPath + '\Debug')
}

Invoke-Expression -Command 'docker cp libremetaverse-builder-for-bluedogebot:/buildenv/pkg/libremetaverse-bin-release.tar libremetaverse-bin-release.tar' -ErrorAction SilentlyContinue

Invoke-Expression -Command 'docker cp libremetaverse-builder-for-bluedogebot:/buildenv/pkg/libremetaverse-bin-debug.tar libremetaverse-bin-debug.tar' -ErrorAction SilentlyContinue



Invoke-Expression -Command ('tar -xf libremetaverse-bin-release.tar ' + ' -C ' + $binPath + '\Release\')
Invoke-Expression -Command ('tar -xf libremetaverse-bin-debug.tar ' + ' -C ' + $binPath + '\Debug\')

Remove-Item libremetaverse-bin-release.tar
Remove-Item libremetaverse-bin-debug.tar

Invoke-Expression -Command 'docker rm --force libremetaverse-builder-for-bluedogebot' -ErrorAction SilentlyContinue
Invoke-Expression -Command 'docker rmi --force libremetaverse-for-bluedogebot' -ErrorAction SilentlyContinue
