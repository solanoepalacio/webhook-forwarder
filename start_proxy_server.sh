#!/bin/bash

echo "CLONE_COUNT: $CLONE_COUNT"
echo "TARGET_PORT: $TARGET_PORT"
echo "TARGET_HOST: $TARGET_HOST"
echo "LISTEN_PORT: $LISTEN_PORT"

CMD="teeproxy -l=:$LISTEN_PORT"

CMD="$CMD -a $TARGET_HOST:$TARGET_PORT"
listeners=$CLONE_COUNT

port=$TARGET_PORT
listeners=$((listeners - 1))

echo "Cloning response to $listeners listeners:"

until [ $listeners -eq 0 ]; do
    port=$(($port + 1))
    CMD="$CMD -b $TARGET_HOST:$port"
    listeners=$((listeners-1))
done

echo $CMD:
$CMD
