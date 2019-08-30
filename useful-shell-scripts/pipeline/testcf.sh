#!/bin/bash

status=`aws cloudformation describe-stacks --stack-name lab-static-web-stack --query "Stacks[].StackStatus" --output text`
echo "Current status of stack is $status"

while [ $status != "CREATE_COMPLETE" ]
do
status=`aws cloudformation describe-stacks --stack-name lab-static-web-stack --query "Stacks[].StackStatus" --output text`
done

aws ecs list-task-definitions | grep "service-web" > deleteme.txt

cut -d, -f1 deleteme.txt > deleteme2.txt

cat deleteme.txt
cat deleteme2.txt

Infraid=`aws cloudformation list-stack-resources --stack-name stg-deserve --query "StackResourceSummaries[1].PhysicalResourceId" --output text `
clusterid=`aws cloudformation list-stack-resources --stack-name $Infraid --query "StackResourceSummaries[0].PhysicalResourceId" --output text`
sgid=`aws cloudformation list-stack-resources --stack-name $clusterid --query "StackResourceSummaries[1].PhysicalResourceId" --output text`
vpcid=`aws cloudformation list-stack-resources --stack-name $Infraid --query "StackResourceSummaries[2].PhysicalResourceId" --output text`
subnetid=`aws cloudformation list-stack-resources --stack-name $vpcid --query "StackResourceSummaries[5].PhysicalResourceId" --output text`
clustername=`aws cloudformation list-stack-resources --stack-name $clusterid --query "StackResourceSummaries[3].PhysicalResourceId" --output text`
count=0
for td in `cat deleteme2.txt `
 do
   td_name=`echo $td| tr -d ' "'`
   aws ecs describe-task-definition --task-definition $td_name | grep start_collect_static.sh
   if [[ $? -eq 0 ]]
    then
      echo "present $td_name"
      count=1
aws ecs run-task \
--launch-type FARGATE \
--cluster $clustername  \
--task-definition $td_name \
--network-configuration "awsvpcConfiguration= { subnets= ["$subnetid"], securityGroups = ["$sgid"], assignPublicIp = "DISABLED"}"
   fi
   if [[ count == 1] ]
     break
   fi
 done

count=0
for td in `cat deleteme2.txt `
 do
   td_name=`echo $td| tr -d ' "'`
   aws ecs describe-task-definition --task-definition $td_name | grep start_migrations.sh
   if [[ $? -eq 0 ]]
    then
      echo "present $td_name"
      count=1
aws ecs run-task \
--launch-type FARGATE \
--cluster $clustername  \
--task-definition $td_name \
--network-configuration "awsvpcConfiguration= { subnets= ["$subnetid"], securityGroups = ["$sgid"], assignPublicIp = "DISABLED"}"
   fi
  if [[ count == 1 ]]
    break
  fi
 done

aws ecs register-task-definition --cli-input-json file:imagedefintions.json
