aws cloudformation create-stack \
    --stack-name lab-stack-infrastructure \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/sub-infrastructure.yml \
    --parameters file://infrastructure.cfg.json \
    --capabilities CAPABILITY_IAM
