docker-insight
==============

## Install

### Docker Hub

Just pull the docker image from Docker Hub.

``` bash
$ docker pull visvirial/insight
```

### Building By Yourself

Alternatively, you can build the docker image on your own.

``` bash
$ docker build --tag=visvirial:insight .
```

## Run

### Launching bitcoind

Insight requires bitcoind to be running.
You should install bitcoind and sync the entire blockchain.

We assume you have already launched and synced [visvirial/docker-bitcoind](https://github.com/visvirial/docker-bitcoind).

### Launching insight

``` bash
$ docker run -itd --name insight --link bitcoind:btcd -p 127.0.0.1:3000:3000 \
	-e INSIGHT_FORCE_RPC_SYNC=1 \
	-e INSIGHT_NETWORK=livenet \
	-e BITCOIND_HOST=btcd \
	-e BITCOIND_USER=${RPCUSER} \
	-e BITCOIND_PASS=${RPCPASSWORD} \
	visvirial/insight
```

`INSIGHT_FORCE_RPC_SYNC=1` is required for Bitcoin Core >0.10 since the block file format is changed.

Insight requires many CPU resources at initial sync and consumes many disk spaces.
Mouting data directory externally is strongly recommended.
Read `launch-docker.sh` and customize it.

