# dotnet-cakebuild

A simple Docker image based on the official **dotnet core sdk image** including [Cake](https://cakebuild.net/) ([Github repository](https://github.com/cake-build/cake)) as a global dotnet tool.

You can use this image for automated builds of .NET Core projects using Cake, e.g. with **Gitlab**.

As of [v0.4](https://github.com/chA0s-Chris/dotnet-cakebuild/releases/tag/0.4) the image includes the Docker CLI.



## Usage

Use the image as base for your project's CI/CD pipeline. Execute these steps inside your project's source directory:

```bash
dotnet cake build.cake --bootstrap
dotnet cake build.cake
```

The first command loads all dependencies of the Cake script (modules, addins) and the second one actually runs the Cake script.

Arguments can be passed the same way you would using Cake original **build.sh**. For example:

```bash
dotnet cake build.cake --target="CI" --configuration="Debug"
```



## Using Docker from inside the image

To use Docker from inside the image, just mount (bind) the host's `docker.sock` to your container. For example:

```bash
docker run -it \
	-v /var/run/docker.sock:/var/run/docker.sock \
	chaos/dotnet-cakebuild:latest
```

Be aware of the security implications this brings with. The container from the example can do anything with the host's Docker service, including removing containers and so on.

It's not recommended to use this method outside of a controlled environment.



## Pre-built image

A pre-built image can be found on [Docker Hub](https://hub.docker.com/r/chaos/dotnet-cakebuild):

```bash
docker pull chaos/dotnet-cakebuild:latest
```



## License

[MIT](https://github.com/chA0s-Chris/dotnet-cakebuild/blob/master/LICENSE)