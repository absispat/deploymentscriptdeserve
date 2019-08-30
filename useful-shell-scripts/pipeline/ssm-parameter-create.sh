aws cloudformation create-stack \
    --stack-name ssm-db \
    --template-url https://s3.us-east-1.amazonaws.com/cloudformation-deserve-cards-pipeline-lab2/infrastucture/ssm.yml \
    --profile deservepoc
