aws cloudformation create-stack \
    --stack-name ssm-db \
    --template-url https://s3.us-east-1.amazonaws.com/cloudformation-deserve-cards-pipeline-lab2/infrastructure/ssm.yml \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::761539273697:role/CloudFormationRole \
    --profile deservepoc
