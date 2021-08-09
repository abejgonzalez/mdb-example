#!/bin/bash

set -ex

mserver5 --dbpath=/tmp/mdb1 --set mapi_port=60001 --set monet_daemon=yes &
mserver5 --dbpath=/tmp/mdb2 --set mapi_port=60002 --set monet_daemon=yes &
mserver5 --dbpath=/tmp/mdb3 --set mapi_port=60003 --set monet_daemon=yes &

# setup initial tables with values and primary keys
mclient -d mdb1 -u monetdb -p 60001 w1p.sql
mclient -d mdb2 -u monetdb -p 60002 w2p.sql

# setup foreign keys
mclient -d mdb1 -u monetdb -p 60001 w1.sql
mclient -d mdb2 -u monetdb -p 60002 w2.sql

# setup "leader" node pointing to "follower" nodes
mclient -d mdb3 -u monetdb -p 60003 w3.sql
