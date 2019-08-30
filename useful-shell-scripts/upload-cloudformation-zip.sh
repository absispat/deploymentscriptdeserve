mkdir sourceartifact
mkdir sourceartifact/pipeline
mkdir sourceartifact/pipeline/configs
mkdir temp
cp ../*.yml sourceartifact/
cp ../*.json sourceartifact/
cp -r ../pipeline/configs sourceartifact/pipeline/
cp -r ../scheduledtasks/ sourceartifact/scheduledtasks
cp -r ../infrastructure sourceartifact/infrastructure
cp -r ../services sourceartifact/services


zip ./temp/static-cloudformation-artifact.zip -r sourceartifact
aws s3 sync ./temp s3://cloudformation-deserve-cards-pipeline-lab2 --exclude "*"  --include "static-cloudformation-artifact.zip" --delete --profile stg-deserve

rm -r sourceartifact
rm -r temp
