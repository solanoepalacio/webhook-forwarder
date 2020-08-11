#!/bin/bash
PROJECT_ROOT=$(pwd)

source .env

cd $(dirname "$0")

if [ -s .env ]
then
    echo "Local env found. Sourcing"
    source .env
fi

echo "STACK_NAME $STACK_NAME"
echo "CLONE_COUNT $CLONE_COUNT"
echo "TARGET_PORT $TARGET_PORT"
echo "LISTEN_PORT $LISTEN_PORT"
echo "TARGET_HOST $TARGET_HOST"
echo "EC2_KEY_NAME $EC2_KEY_NAME"

echo "AWS_REGION $AWS_REGION"
echo "AWS_REGION $AMI_ID"

filepath="./init-script.sh"
cp ./ec2-init-script.template.sh $filepath;

sed -i "s/<<CLONE_COUNT>>/${CLONE_COUNT}/g" $filepath;
sed -i  "s/<<TARGET_PORT>>/${TARGET_PORT}/g" $filepath;
sed -i  "s/<<LISTEN_PORT>>/${LISTEN_PORT}/g" $filepath;
sed -i  "s/<<TARGET_HOST>>/${TARGET_HOST}/g" $filepath;

aws cloudformation create-stack \
  --region $AWS_REGION \
  --stack-name $STACK_NAME \
  --template-body file://aws-infrastructure.yml \
  --parameters \
    ParameterKey=EC2KeyName,ParameterValue=$EC2_KEY_NAME \
    ParameterKey=InstanceInitScript,ParameterValue=$(base64 -w0 $filepath) \
    ParameterKey=ListenPort,ParameterValue=$LISTEN_PORT \
    ParameterKey=AmiId,ParameterValue=$AMI_ID


if [ ! $? -eq 0  ]
then
  echo "Deploy failed."
  exit 1;
fi

# # Wait until the stack creation is complete
echo "Waiting for stack create complete"
aws cloudformation wait stack-create-complete --stack-name $STACK_NAME

rm ./init-script.sh

echo "Done."