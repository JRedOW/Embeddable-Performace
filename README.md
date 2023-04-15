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

`docker run --rm -it --mount type=bind,source=$(pwd)/output,target=/home/output embeddableperformance`

or PowerShell

`docker run --rm -it --mount type=bind,source=${PWD}/output,target=/home/output embeddableperformance`

## Generating Charts (Needed For Paper)

`docker build . -f Dockerfile.charts -t embeddableperformance:charts`
`docker run --rm -it --mount type=bind,source=$(pwd)/output,target=/home/output embeddableperformance:charts` or PowerShell `docker run --rm -it --mount type=bind,source=${PWD}/output,target=/home/output embeddableperformance:charts`

## Generating Paper

`docker build . -f Dockerfile.paper -t embeddableperformance:paper`
`docker run --rm -it --mount type=bind,source=$(pwd)/output,target=/data/output embeddableperformance:paper` or PowerShell `docker run --rm -it --mount type=bind,source=${PWD}/output,target=/data/output embeddableperformance:paper`
