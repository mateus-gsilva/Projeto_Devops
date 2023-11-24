# Projeto Pipeline CI/CD

Este projeto foi desenvolvido como parte de um desafio em um processo seletivo e consiste na construção de uma pipeline do zero.

## Começando

Certifique-se de ter as seguintes ferramentas configuradas em seu ambiente:
- AWS CLI.
- Terraform.
- Docker (para validação inicial).
- Projeto configurado no CircleCI associado ao repositório do GitHub.

### Variáveis de Ambiente - CircleCI

Configure as seguintes variáveis de ambiente no CircleCI:

1. AWS_ACCOUNT_ID = ID da conta.
2. AWS_ECR_REGISTRY_ID = ID do registro ECR.
3. AWS_REGION = Região padrão (use as mesmas definidas em terraform/variables.tf).
4. AWS_ACCESS_KEY_ID = Chave de acesso para a AWS.
5. AWS_SECRET_ACCESS_KEY = Chave secreta para a AWS.
6. MY_APP_PREFIX = Prefixo a ser utilizado em seu projeto.

## Tecnologias Utilizadas

- Terraform para Infraestrutura como Código.
- CircleCI para Pipeline CI/CD.
- ECS/Fargate como gerenciador de containers.
- ECR como repositório de código.
- Cloudwatch para monitoramento (em andamento).
- AWS como provedor de nuvem.
- GitHub como repositório.

## Deploy

1. Configure as variáveis de ambiente no CircleCI conforme mencionado anteriormente.
2. Execute a estrutura em Terraform.
3. O CircleCI automaticamente efetuará o deploy do código em ECS.
4. Acesse a aplicação pelo DNS do LoadBalancer.

Toda alteração na aplicação será automaticamente refletida na estrutura AWS.

## Estrutura Terraform/AWS

### VPC, Subnets e Security Groups

A estrutura Terraform consiste em uma VPC com 3 subnets em 3 AZs diferentes e Security Groups para o ALB e ECS.

### ECS Cluster

O ECS Cluster possui um serviço que efetua o deploy de 3 tasks, com rollout em caso de atualização.

### CloudWatch

Utilizamos as métricas do cluster ECS para monitoramento.

## CircleCI

Toda alteração do código da aplicação é identificada automaticamente e buildada, testada e feito o deploy pelo CircleCI.

### Job 1 - Test
![Job Test](/images/circleci-job-test.png)

É feito o checkout e executado o npm test.

### Job 2 - Build and Push Image
![Job Build and Push Image](/images/circleci-job-build-and-push-image.png)

A imagem é buildada e feito o deploy para o repositório no ECR.

### Job 3 - Update Service Update
![Job Update Service Update](/images/circleci-job-deploy-service-update.png)

É atualizado o serviço e cadastrada uma nova task definition.

### Job 4 - Update Service Update
![Job Update ECR URI](/images/circleci-job-update-ecr-uri.png)

A imagem é atualizada com a nova URI e associada ao container da task definition.

## Como Acessar

Utilize o DNS do load balancer, disponível no output do Terraform ou no console. A aplicação está disponível em: [projeto-devops](http://projeto-devops-1315227714.us-east-1.elb.amazonaws.com/)

