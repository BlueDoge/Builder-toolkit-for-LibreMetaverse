FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine

#build out our structure, git will populate 'src' later
RUN mkdir -p /buildenv/bin
RUN mkdir -p /buildenv/pkg

WORKDIR /buildenv

#pull down the source
RUN git clone https://github.com/cinderblocks/libremetaverse.git src

#jump to the source
WORKDIR /buildenv/src

RUN dotnet restore LibreMetaverse.ReleaseNoGui.sln

#build the libraries
RUN dotnet build LibreMetaverse.ReleaseNoGui.sln -c ReleaseNoGui

#jump back to our build's root
WORKDIR /buildenv

# copy over only the needed files
RUN cp ./src/bin/net6.0/*.dll ./bin/
RUN cp ./src/bin/net6.0/*.pdb ./bin/
RUN cp ./src/bin/net6.0/*.json ./bin/
RUN cp ./src/bin/net6.0/*.xml ./bin/

#copy license file
RUN cp ./src/LICENSE.txt ./bin/LICENSE-LibreMetaverse.txt

#jump to the bin directory
WORKDIR /buildenv/bin

#archive this bin directory to the pkg directory as libremetaverse-bin.tar
RUN tar -cf ../pkg/libremetaverse-bin-release.tar .



#now start the debug build

#move over to the bin directory
WORKDIR /buildenv

#clear the bin folder
RUN rm ./bin/* -f

#move over to the source again
WORKDIR /buildenv/src

#clean the previous configuration out
RUN dotnet clean LibreMetaverse.ReleaseNoGui.sln -c ReleaseNoGui --nologo

#build the Debug configuration
RUN dotnet build LibreMetaverse.ReleaseNoGui.sln -c Debug --nologo

#jump back to our build's root
WORKDIR /buildenv

# copy over only the needed files
RUN cp ./src/bin/net6.0/*.dll ./bin/
RUN cp ./src/bin/net6.0/*.pdb ./bin/
RUN cp ./src/bin/net6.0/*.json ./bin/

#copy license file
RUN cp ./src/LICENSE.txt ./bin/LICENSE-LibreMetaverse.txt

#jump to the bin directory
WORKDIR /buildenv/bin

#archive this bin directory to the pkg directory as libremetaverse-bin.tar
RUN tar -cf ../pkg/libremetaverse-bin-debug.tar .

#clean up the source and bin
RUN rm -rf ./bin
RUN rm -rf ./src
