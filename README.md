# dotnet-cakebuild

A simple Docker image based on the official **dotnet core sdk image** including [Cake](https://cakebuild.net/) ([Github repository](https://github.com/cake-build/cake)) as a global dotnet tool.

You can use this image for automated builds of .NET Core projects using Cake, e.g. with **Gitlab**.



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



## License

[MIT](https://github.com/chA0s-Chris/dotnet-cakebuild/blob/master/LICENSE)