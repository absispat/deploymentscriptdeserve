aws cloudformation update-stack \
    --stack-name lab-stack-st \
    --template-url https://s3.us-east-2.amazonaws.com/cloudformation-deserve-cards-test/sub-scheduledtask.yml \
    --parameters file://serviceworker.cfg.json
