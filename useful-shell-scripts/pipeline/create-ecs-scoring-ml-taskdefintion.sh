aws cloudformation create-stack \
    --stack-name stg-dsa-taskdefintion  \
    --template-url https://s3.us-east-1.amazonaws.com/cloudformation-deserve-cards-pipeline-lab2/services/dsa-scoring-ml.yml \
    --parameters file://../../pipeline/configs/ecs-scoring-ml-taskdefintion.json \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::761539273697:role/CloudFormationRole \
    --profile stg-deserve
