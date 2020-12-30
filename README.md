# Terraform module for AWS DocumentDB Cluster

To know how to use please refer to `examples` folder  
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apply\_immediately | (Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| auto\_minor\_version\_upgrade | (Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true. | `bool` | `true` | no |
| backup\_retention\_period | (Optional) The days to retain backups for. Default 1 | `number` | `1` | no |
| cluster\_family | The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html | `string` | `"docdb3.6"` | no |
| cluster\_size | Number of DB instances to create in the cluster | `number` | `1` | no |
| db\_cluster\_parameter\_group\_name | (Optional) A cluster parameter group to associate with the cluster. | `string` | `""` | no |
| db\_subnet\_group\_name | (Optional) A DB subnet group to associate with this DB instance. | `string` | `""` | no |
| deletion\_protection | (Optional) A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. | `bool` | `false` | no |
| enabled | Do you want to create Docdb | `bool` | `true` | no |
| enabled\_cloudwatch\_logs\_exports | (Optional) List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler. | `list(string)` | <pre>[<br>  "audit",<br>  "profiler"<br>]</pre> | no |
| engine | (Optional) The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid Values: docdb | `string` | `"docdb"` | no |
| engine\_version | (Optional) The database engine version. Updating this argument results in an outage. | `string` | `null` | no |
| final\_snapshot\_identifier | (Optional) The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. | `string` | `null` | no |
| instance\_class | The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs | `string` | `"db.t3.medium"` | no |
| kms\_key\_id | (Optional) The ARN for the KMS encryption key. When specifying kms\_key\_id, storage\_encrypted needs to be set to true. | `string` | `null` | no |
| master\_password | (Required unless a snapshot\_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocDB Naming Constraints. | `string` | n/a | yes |
| master\_username | (Required unless a snapshot\_identifier is provided) Username for the master DB user. | `string` | n/a | yes |
| name | (Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier. | `string` | `""` | no |
| parameter | List of DB parameters to apply | `list(string)` | `[]` | no |
| port | (Optional) The port on which the DB accepts connections | `number` | `27017` | no |
| preferred\_backup\_window | (Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00 | `string` | `"07:00-09:00"` | no |
| preferred\_maintenance\_window | (Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi | `string` | `"Mon:00:00-Mon:03:00"` | no |
| promotion\_tier | (Optional) Default 0. Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoter to writer. | `number` | `0` | no |
| skip\_final\_snapshot | (Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is false. | `bool` | `false` | no |
| snapshot\_identifier | (Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot. | `string` | `null` | no |
| storage\_encrypted | (Optional) Specifies whether the DB cluster is encrypted. The default is false. | `bool` | `true` | no |
| subnet\_ids | (Required) A list of VPC subnet IDs. If you are not passing db\_subnet\_group\_name | `list(string)` | `[]` | no |
| tags | A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws\_autoscaling\_group requires. | `map(string)` | `{}` | no |
| vpc\_security\_group\_ids | (Optional) List of VPC security groups to associate with the Cluster | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the cluster |
| ca\_cert\_identifier | (Optional) The identifier of the CA certificate for the DB instance |
| cluster\_members | List of DocDB Instances that are a part of this cluster |
| cluster\_resource\_id | The DocDB Cluster Resource ID |
| endpoint | Endpoint of the DocumentDB cluster |
| id | The DocDB Cluster Identifier |
| instances\_arn | Amazon Resource Name (ARN) of cluster instance |
| parameter\_group\_arn | The ARN of the documentDB cluster parameter group.arn |
| parameter\_group\_id | ID of the DocumentDB cluster Security Group |
| reader\_endpoint | A read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas |
| subnet\_group\_arn | The ARN of the documentDB cluster parameter group.arn |
| subnet\_group\_id | ID of the DocumentDB cluster Security Group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## License

Apache 2 Licensed. See LICENSE for full details.

