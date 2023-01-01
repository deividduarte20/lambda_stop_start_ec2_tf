## Esse projeto consiste em provisionar agendamento de stop/start de instâncias EC2

### Para inserir instâncias no desligamento por horário basta inserir tag na instância desejada

key: schedule value: true

### Em variable expr no arquivo de variables.tf ajuste o horário necessário lembrando que são 3 horas a frente, exemplo se você deseja efetuar o stop no horário de 18:00 insira 21:00.

## Baixe o projeto
`git clone https://github.com/deividduarte20/lambda_stop_start_ec2_tf.git`

## Inicie o terraform
`terraform init`

## Aplique a infra como código
`terraform apply`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.2.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.profile_startec2_lambda_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.profile_stopec2_lambda_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.profile_gstopec2_lambda_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.profile_startec2_lambda_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.cloudprotegida-ec2-lambda-role-stopstart](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudprotegida-ec2-lambda-policy-stopstart](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_function.lambda_startec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function.lambda_stopec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch_startec2_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.allow_cloudwatch_to_call_stopec2_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.lambda_startec2](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [archive_file.lambda_stopec2](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_env"></a> [lambda\_env](#input\_lambda\_env) | n/a | `map` | <pre>{<br>  "KEY": "schedule",<br>  "VALUE": "true"<br>}</pre> | no |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | n/a | `number` | `600` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | `"default"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"lambda-manager-ec2"` | no |
| <a name="input_sched_expr"></a> [sched\_expr](#input\_sched\_expr) | n/a | `map` | <pre>{<br>  "start": "cron(0 10 ? * * *)",<br>  "stop": "cron(00 21 ? * * *)"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "Name": "lambda-manager-ec2",<br>  "Product": "lambda",<br>  "Team": "sre"<br>}</pre> | no |

