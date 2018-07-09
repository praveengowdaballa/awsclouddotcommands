#!/bin/bash
instance_id=$(aws ec2 run-instances --image-id ami-b70554c8 \
     --query Reservations[].Instances[].InstanceId \
     --output text)
instance_state=$$(aws ec2 describe-instances --instance-ids $instance_id \
     --query 'Reservations[].Instances[].State.Name')
while [ "instance _state" != "running" ]
do
     sleep 1
     instance _state=$(aws ec2 describe-instances --instance-ids $instance_id \
              'Reservations[].Instances[].State.Name')
done

