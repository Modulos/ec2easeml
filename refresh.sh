#!/bin/bash
cd $GOPATH/src/github.com/ds3lab/easeml/web;npm run build;cd ..;packr install github.com/ds3lab/easeml;easeml start --login --server-address 0.0.0.0:8080
cd $GOPATH/src/github.com/ds3lab/easeml/