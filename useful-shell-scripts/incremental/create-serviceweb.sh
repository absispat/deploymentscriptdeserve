aws cloudformation create-stack \
    --stack-name lab-stack-serviceweb \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/sub-serviceweb.yml \
    --parameters file://serviceweb.cfg.json
