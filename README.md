# Projeto Pipeline CI/CD

Um desafio de um processo seletivo que participei, que  constitui em construir uma pipeline do zero.

## Começando

AWS CLI em seu editor de texto
Terraform configurado em seu ambiente
Crie o projeto no CircleCI e associe ao projeto do GitHub

### Variáveis de Ambiente - CircleCI

Configure as seguitnes variaveis de ambiente no CircleCI:


AWS_ACCOUNT_ID = id da conta
AWS_ECR_REGISTRY_ID = id da conta
AWS_REGION = região padrão. deve ser utilizada as mesmas localizadas em terraform/variables.tf
AWS_ACCESS_KEY_ID = access key para acessar a aws
AWS_SECRET_ACCESS_KEY = secret key para acessar a aws
MY_APP_PREFIX = prefixo que será utilizado em seu projeto

## Tecnologias utilizadas

1 - utilizarei o Terraform como Infraestrutura como Código 

2 - CircleCI como Pipeline CI/CD

3 - ECS/Fargate como gerenciador de containers

4 - Cloudwatch como monitoramento

5 - AWS como Cloud

6 - Git como repositório

###Deploy

1 - Configure as variáveis de ambiente no Circle CI
2 - Execute a estrutura em terraform
3 - O CircleCI automaticamente efetuará o deploy do código em ECS
4 - acesse a aplicação pelo output do DNS do LoadBalancer

Toda alteração na aplicaçaõ será automaticamente refletida na estrutura AWS.

