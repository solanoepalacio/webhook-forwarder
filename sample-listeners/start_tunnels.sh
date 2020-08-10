#!/bin/bash

ssh -i ./ssh-port-fwd-test.pem -nN -R 8000:localhost:8000 ec2-user@3.21.55.104 
ssh -i ./ssh-port-fwd-test.pem -nN -R 8001:localhost:8001 ec2-user@3.21.55.104
ssh -i ./ssh-port-fwd-test.pem -nN -R 8002:localhost:8002 ec2-user@3.21.55.104
ssh -i ./ssh-port-fwd-test.pem -nN -R 8003:localhost:8003 ec2-user@3.21.55.104
ssh -i ./ssh-port-fwd-test.pem -nN -R 8004:localhost:8004 ec2-user@3.21.55.104
