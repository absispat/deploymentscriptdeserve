aws cloudformation create-stack \
    --stack-name lab-stack-serviceworker \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/sub-serviceworker.yml \
    --parameters file://serviceworker.cfg.json
