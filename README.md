# Projeto Pipeline CI/CD

Um desafio de um processo seletivo que participei, que  constitui em construir uma pipeline do zero.

## Começando

AWS CLI em seu editor de texto
Terraform configurado em seu ambiente
Crie o projeto no CircleCI e associe ao projeto do GitHub

### Variáveis de Ambiente - CircleCI

Configure as seguitnes variaveis de ambiente no CircleCI:


1 - AWS_ACCOUNT_ID = id da conta

2 - AWS_ECR_REGISTRY_ID = id da conta

3 - AWS_REGION = região padrão. deve ser utilizada as mesmas localizadas em terraform/variables.tf

4 - AWS_ACCESS_KEY_ID = access key para acessar a aws

5 - AWS_SECRET_ACCESS_KEY = secret key para acessar a aws

6 - MY_APP_PREFIX = prefixo que será utilizado em seu projeto

## Tecnologias utilizadas


utilizarei o Terraform como Infraestrutura como Código

CircleCI como Pipeline CI/CD

ECS/Fargate como gerenciador de containers, e um load balancer para balancear carga

ECR como repositório de código

Cloudwatch como monitoramento - em andamento

AWS como Cloud

Github como repositório

## Deploy

1 - Configure as variáveis de ambiente no Circle CI

2 - Execute a estrutura em terraform

3 - O CircleCI automaticamente efetuará o deploy do código em ECS

4 - acesse a aplicação pelo output do DNS do LoadBalancer

Toda alteração na aplicação será automaticamente refletida na estrutura AWS.

## Estrutura Terraform

A estrutura terraform consiste em uma VPC com 3 Subnets em 3 AZ's diferentes, um SG de borda para o ALB e o segundo SG encaminha para o serviço do ECS que apenas aceita request do SG do ALB.

O ALB encaminha todas as requisições para o serviço do ECS, assim balanceando a carga e mantendo o mesmo DNS.

## CircleCI

Toda alteração do código da aplicação é identificada automaticamente e buildada, testada e feito o deploy pelo CircleCI.

O deploy é feito atualizando a task definition do serviço ECS, assim replicando para as tasks criada pelo mesmo.

## Como acessar

Utilize o DNS do loadbalancer, você pode obte-lo pelo output do terraform ou pelo console.

A minha aplicação está disponível em: projeto-devops-1472919049.us-east-1.elb.amazonaws.com



