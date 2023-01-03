#!/usr/bin/env bash

HOSTS_FILE='./nodes.txt'
> $HOSTS_FILE
for n in node{0..9}; do echo "$n" >> $HOSTS_FILE; done

BATCH_SIZE=4
SLEEP_SECS_PER_NODE=1
SLEEP_SECS_PER_BATCH=1

node_count="$(cat $HOSTS_FILE | wc -l)"
node_count=${node_count##* } # remove empty spaces at the beginning
batch_count="$(( node_count / BATCH_SIZE ))"
echo '' 1>&2
echo "Nodes to process:        $node_count" 1>&2
echo "Batch size and count:    $BATCH_SIZE / $batch_count" 1>&2
echo "Sleep seconds per node:  $SLEEP_SECS_PER_NODE" 1>&2
echo "Sleep seconds per batch: $SLEEP_SECS_PER_BATCH" 1>&2
echo '' 1>&2

node_counter=0
batch_counter=0

while mapfile -t -n $BATCH_SIZE nodes && ((${#nodes[@]})); do 
    for node in ${nodes[@]}; do
        echo "node $(( node_counter++ )): $node"
        sleep $SLEEP_SECS_PER_NODE
    done
    (( batch_counter++ ))
    [ "$node_counter" -lt "$node_count" ] && {
        echo "Completed $node_counter of $node_count nodes;" \
             "batch $batch_counter of $batch_count;" \
             "sleeping for $SLEEP_SECS_PER_BATCH seconds..." 1>&2
        sleep $SLEEP_SECS_PER_BATCH
    }
done < $HOSTS_FILE