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



1 - utilizarei o Terraform como Infraestrutura como Código 

2 - CircleCI como Pipeline CI/CD

3 - ECS/Fargate como gerenciador de containers, e um load balancer para balancear carga

4 - ECR como repositório de código.

5 - Cloudwatch como monitoramento

6 - AWS como Cloud

7 - Git como repositório

##Deploy

1 - Configure as variáveis de ambiente no Circle CI
2 - Execute a estrutura em terraform
3 - O CircleCI automaticamente efetuará o deploy do código em ECS
4 - acesse a aplicação pelo output do DNS do LoadBalancer

Toda alteração na aplicaçaõ será automaticamente refletida na estrutura AWS.

##Estrutura Terraform

A estrutura terraform consiste em uma VPC com 3 Subnets em 3 AZ's diferentes, um SG de borda para o ALB e o segundo SG encaminha para o serviço do ECS que apenas aceita request do SG do ALB.

O ALB encaminha todas as requisições para o serviço do ECS, assim balanceando a carga e mantendo o mesmo DNS.

## CircleCI

Toda alteração do código da aplicação é identificada automaticamente buildada pelo CircleCI, e adiciando como ultima revisão na task definition do ECS e automaticante atualizada pelo serviço do ECS, assim o deploy não tem downtime e em alguns minutos a alteração já está no ar.



