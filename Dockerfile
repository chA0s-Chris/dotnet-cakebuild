FROM mcr.microsoft.com/dotnet/core/sdk:3.0

# add dotnet tools to path
ENV PATH="$PATH:/root/.dotnet/tools" \
    CAKE_TOOL_VERSION="0.35.0"

# install Cake as global tool
RUN dotnet tool install --global Cake.Tool --version ${CAKE_TOOL_VERSION}

# install docker cli
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-transport-https && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >/etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get remove --purge -y apt-transport-https && \
    rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/docker.list

# install Azure Devops credential provider
RUN curl -H "Accept: application/octet-stream" \
    -s -S -L \
    "https://github.com/Microsoft/artifacts-credprovider/releases/latest/download/Microsoft.NuGet.CredentialProvider.tar.gz" | tar xz -C ~/.nuget plugins/netcore
