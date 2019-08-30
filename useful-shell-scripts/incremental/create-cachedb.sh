aws cloudformation create-stack \
    --stack-name lab-stack-cachedb \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/sub-cachedb.yml \
    --parameters file://cachedb.cfg.json
