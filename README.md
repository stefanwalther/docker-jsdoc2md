# docker-jsdoc2md

> Docker image to run jsdoc2md (jsdoc-to-markdown).

[![CircleCI](https://img.shields.io/circleci/project/github/stefanwalther/docker-jsdoc2md.svg)](https://circleci.com/gh/stefanwalther/docker-jsdoc2md/tree/master)

## Motivation

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

... none known so far ...

## Changelog

See [CHANGELOG file](CHANGELOG.yml)

## About

### Author

**Stefan Walther**

* [stefanwalther.io](http://stefanwalther.io)
* [qliksite.io](http://qliksite.io)
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
Copyright © 2017, [Stefan Walther](http://qliksite.io).
 
MIT

