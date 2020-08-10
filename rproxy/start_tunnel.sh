#!/bin/bash

echo "FORWARD_FROM_PORT: $FORWARD_FROM_PORT"
echo "FORWARD_FROM_HOST: $FORWARD_FROM_HOST"
echo "FORWARD_TO_PORT: $FORWARD_TO_PORT"
echo "FORWARD_TO_HOST: $FORWARD_TO_HOST"

chmod 400 key.pem

CMD="ssh -i ./key.pem -nN -y -R $FORWARD_FROM_PORT:$FORWARD_TO_HOST:$FORWARD_TO_PORT ec2-user@$FORWARD_FROM_HOST"

echo $CMD

$CMD