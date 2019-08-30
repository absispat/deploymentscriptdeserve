aws cloudformation create-stack \
    --stack-name stg-dsa  \
    --template-url https://s3.us-east-1.amazonaws.com/cloudformation-deserve-cards-pipeline-lab2/infrastructure/ecs-scoring-cluster.yml \
    --parameters file://../../pipeline/configs/ecs-scoring-ml-cluster.json \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::761539273697:role/CloudFormationRole \
    --profile stg-deserve
