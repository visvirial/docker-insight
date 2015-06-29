#!/bin/bash

PORT=3000
DATADIR=$HOME/docker-data/insight
RPCUSER=bitcoin
RPCPASSWORD=bitcoinrpc

mkdir -p $DATADIR

# Launch a container.
docker run -itd --name insight --link bitcoind:btcd -p 127.0.0.1:$PORT:$PORT \
	$(test -d $DATADIR && echo -v $DATADIR:/home/docker/.insight) \
	-e INSIGHT_FORCE_RPC_SYNC=1 \
	-e INSIGHT_NETWORK=livenet \
	-e INSIGHT_PORT=$PORT \
	-e BITCOIND_HOST=btcd \
	-e BITCOIND_USER=${RPCUSER} \
	-e BITCOIND_PASS=${RPCPASSWORD} \
	visvirial/insight


