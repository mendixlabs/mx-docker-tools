# Mendix Dev Docker Tools

This repository contains a set of helper tools to execute Mendix console tools (mxbuild, mxutil, mx) in docker context.

Especially useful for CI / CD spenarios like:
* Building and exporting mda (Mendix deployment archive) using `mxbuild`
* Exporting module packages with `mxutil`

# Usage

Build the docker image with the required Mendix version

```sh
cd src
docker build . --build-arg MX_VERSION=8.18.6.20572
```

Run the required tool, e.g. running mxutil to extact the module package
```sh
docker run -v ~/Mendix/MyApp:/opt/app IMAGE_ID mxutil.exe create-module-package --package-dir /opt/app/packages/ /opt/app/App.mpr "MyModule"
```

> `$JAVA_HOME` environment variable is avaliable on path inside the container and can be referred to when using `mxbuild`.
