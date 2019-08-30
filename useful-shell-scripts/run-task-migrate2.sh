aws ecs run-task \
--launch-type FARGATE \
--cluster stg-deserve-Infrastructure-196SN3OC227WW-AppClusterStack-1GE8HX1JVZBXV-ECSCluster-ID4DVHJK18BM  \
--task-definition service-web:186 \
--network-configuration "awsvpcConfiguration= { subnets= ["subnet-0a805c79a4173150f"], securityGroups = ["sg-02261ffecd97e1814"], assignPublicIp = "DISABLED"}" \
--profile deserve2

aws ecs run-task \
--launch-type FARGATE \
--cluster stg-deserve-Infrastructure-196SN3OC227WW-AppClusterStack-1GE8HX1JVZBXV-ECSCluster-ID4DVHJK18BM  \
--task-definition service-web:187 \
--network-configuration "awsvpcConfiguration= { subnets= ["subnet-0a805c79a4173150f"], securityGroups = ["sg-02261ffecd97e1814"], assignPublicIp = "DISABLED"}" \
--profile deserve2

aws ecs run-task \
--launch-type FARGATE \
--cluster stg-deserve-Infrastructure-196SN3OC227WW-AppClusterStack-1GE8HX1JVZBXV-ECSCluster-ID4DVHJK18BM  \
--task-definition service-web:188 \
--network-configuration "awsvpcConfiguration= { subnets= ["subnet-0a805c79a4173150f"], securityGroups = ["sg-02261ffecd97e1814"], assignPublicIp = "DISABLED"}" \
--profile deserve2
