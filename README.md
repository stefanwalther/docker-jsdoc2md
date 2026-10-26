# docker-jsdoc2md

> Docker image to run jsdoc2md (jsdoc-to-markdown).

[![CI](https://github.com/stefanwalther/docker-jsdoc2md/actions/workflows/ci.yml/badge.svg)](https://github.com/stefanwalther/docker-jsdoc2md/actions/workflows/ci.yml)

## Motivation

[jsdoc-to-markdown](https://github.com/jsdoc2md/jsdoc-to-markdown) is a great tool to create markdown files directly from the source code. This solution just dockerizes the tool, which makes it easier to use across projects with zero installation inside the projects.

The image is based on `node:24-alpine` and bundles `jsdoc-to-markdown` v9. Modern JavaScript (including `async`/`await` and classes) is parsed natively, so no babel setup is needed. If your project has its own `jsdoc.json`, mount it alongside your sources and it will be picked up automatically; otherwise the image runs without one.

## Run

```sh
$ docker run --rm -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md "source-files" > "output"
```

### Run as npm script

A very convenient approach is to just add a script to your `package.json` file:

```js
"scripts": {
    "api-docs": "docker run --rm -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md ./src/index.js > ./docs/api-docs.md"
}
```
This would convert all the jsdoc information from `./src/index.js` and create a file `./docs/api-docs.md`.

## Configuration

## Installation

### Prerequisites

- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)

## Known Issues

- Fixed: mounting a volume on `/opt/jsdoc2md` used to hide the image's `node_modules/.bin` (see [#12](https://github.com/stefanwalther/docker-jsdoc2md/issues/12)). The tool is now installed outside the work directory (`/usr/local/jsdoc2md`), so `-v ${PWD}:/opt/jsdoc2md` keeps working.

## Changelog

See [CHANGELOG file](CHANGELOG.yml)

## About

### Author

**Stefan Walther**

* [github/stefanwalther](https://github.com/stefanwalther)
* [Twitter](http://twitter.com/waltherstefan)
* [LinkedIn](https://www.linkedin.com/in/stefanwalther/)

### Contributing

Pull requests and stars are always welcome. For bugs and feature requests, [please create an issue](https://github.com/stefanwalther/docker-jsdoc2md/issues). The process for contributing is outlined below:

1. Create a fork of the project
2. Work on whatever bug or feature you wish
3. Create a pull request (PR)

I cannot guarantee that I will merge all PRs but I will evaluate them all.

### License
Copyright © 2017, Stefan Walther.
 
MIT

