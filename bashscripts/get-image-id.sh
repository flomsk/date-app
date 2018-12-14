#!/bin/bash
eval $(aws ecr get-login --no-include-email | sed 's|https://||')
IMAGE_APP=$(aws ecr describe-repositories --repository-names engage-app --query 'repositories[0].repositoryUri' --output text)
envfile=.env
echo "IMAGE_APP=$IMAGE_APP" > $envfile
