# Pack Horizn for NuGet 

### Configure a dotnet core app for bundling content

Do this once when we create a project that requires content to be bundled with the nuget package.

```sh
dotnet add package BuildBundlerMinifier
```

Configure your `bundleconfig.json` file. This file get's used when we call `dotnet build`.

```js
// bundleconfig.json
[{
   "outputFileName": "wwwroot/css/horizn.min.css",
   "inputFiles": ["horizn.css"],
   "minify": { "enabled": false, "renameLocals": false },
   "sourceMap": false
},{
   "outputFileName": "wwwroot/css/horizn.css",
   "inputFiles": ["horizn.css"],
   "minify": {"enabled": false, "renameLocals": false },
   "sourceMap": false
}]
```

### Pack this src for release deployment

```sh
cd src/
dotnet restore
dotnet build -c release
dotnet pack -c release
```

### Publishing the NuGet package

```sh
cd src/bin/release
dotnet nuget push *.nupkg -k [guid] -s "https://www.nuget.org/api/v2/package"
```

Where `[guid]` is the secret key I store locally
