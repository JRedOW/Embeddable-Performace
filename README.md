# Langs:

| Lang   | Version |
| ------ | ------- |
| Lua    | 5.4.4   |
| LuaJIT | 2.0.5   |

# Running Experiment

All that is needed is [docker](https://docs.docker.com/get-docker/)

## Building

`docker build . -t embeddableperformance`

## Running

`docker run --rm -it embeddableperformance`

## Generating Paper

`docker build . -f Dockerfile.paper -t embeddableperformance:paper`
`docker run --rm -it --mount type=bind,source=$(pwd)/output,target=/data/output embeddableperformance:paper` or PowerShell `docker run --rm -it --mount type=bind,source=${PWD}/output,target=/data/output embeddableperformance:paper`
