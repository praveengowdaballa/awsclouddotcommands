#!/bin/bash
instance_id $(aws ec2 run-instances --image-id ami--b70554c8 \
      -- query Reservations[].Instances[].InstanceId \
      -- output text )
aws ec2 wait instance-running --instance-ids $instance_id
