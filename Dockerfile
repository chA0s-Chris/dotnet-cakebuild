FROM mcr.microsoft.com/dotnet/core/sdk:2.2

# add dotnet tools to path
ENV PATH="$PATH:/root/.dotnet/tools" \
    CAKE_TOOL_VERSION="0.34.1"

# install Cake as global tool
RUN dotnet tool install --global Cake.Tool --version ${CAKE_TOOL_VERSION}
