#!/bin/bash
defvpc=$(aws ec2 describe-vpcs --output text --query 'Vpcs[*].VpcId')
defsuba=$(aws ec2 describe-subnets --output text --query 'Subnets[?AvailabilityZone==`eu-west-1a`].SubnetId')
defsubb=$(aws ec2 describe-subnets --output text --query 'Subnets[?AvailabilityZone==`eu-west-1b`].SubnetId')
defsubc=$(aws ec2 describe-subnets --output text --query 'Subnets[?AvailabilityZone==`eu-west-1c`].SubnetId')
imagerepo=$(aws ecr describe-repositories --repository-names engage-app --query 'repositories[0].repositoryUri' --output text)
imageapp=$imagerepo:latest
iamarn=$(aws iam get-user --user-name $1 --query 'User.Arn' --output text)
sed -i "s/defvpc/$defvpc/g" cftemplates/*.yml
sed -i "s@defsuba@$defsuba@" cftemplates/*.yml
sed -i "s@defsubb@$defsubb@" cftemplates/*.yml
sed -i "s@defsubc@$defsubc@" cftemplates/*.yml
sed -i "s@imageapp@$imageapp@" cftemplates/app.yml
sed -i "s@iamarn@$iamarn@" cftemplates/ecr.yml
