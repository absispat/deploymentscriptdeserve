aws cloudformation update-stack \
    --stack-name lab-stack-test \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/master.yml \
    --parameters file://master.cfg.json \
    --capabilities CAPABILITY_IAM