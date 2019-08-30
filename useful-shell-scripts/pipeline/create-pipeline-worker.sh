aws cloudformation create-stack \
    --stack-name portal-stg-worker \
    --template-url https://s3.us-east-1.amazonaws.com/cloudformation-deserve-cards-pipeline-lab2/sub-serviceworker.yml \
    --parameters file://../../pipeline/configs/pipeline-worker.cfg.json \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::761539273697:role/CloudFormationRole \
    --profile stg-deserve
