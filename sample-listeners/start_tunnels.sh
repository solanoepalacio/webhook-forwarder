#!/bin/bash

ssh -i ~/.ssh/webhook-fwd.pem -nN -R 8000:localhost:8000 ec2-user@3.128.226.10
ssh -i ~/.ssh/webhook-fwd.pem -nN -R 8001:localhost:8001 ec2-user@3.128.226.10
ssh -i ~/.ssh/webhook-fwd.pem -nN -R 8002:localhost:8002 ec2-user@3.128.226.10
ssh -i ~/.ssh/webhook-fwd.pem -nN -R 8003:localhost:8003 ec2-user@3.128.226.10
ssh -i ~/.ssh/webhook-fwd.pem -nN -R 8004:localhost:8004 ec2-user@3.128.226.10
