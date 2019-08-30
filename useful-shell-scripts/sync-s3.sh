aws s3 sync ../ s3://cloudformation-deserve-cards-pipeline-lab2 --exclude "*" --include "*.yml" --include "*/*.yml" --delete --profile stg-deserve
