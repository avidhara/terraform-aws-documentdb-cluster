
variable "enabled" {
  type        = bool
  description = "Do you want to create Docdb"
  default     = true
}

variable "name" {
  type        = string
  description = "(Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  default     = {}
}

variable "subnet_ids" {
  type        = list(string)
  description = " (Required) A list of VPC subnet IDs. If you are not passing db_subnet_group_name"
  default = [

  ]
}


variable "engine" {
  type        = string
  description = "(Optional) The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid Values: docdb"
  default     = "docdb"
}

variable "engine_version" {
  type        = string
  description = " (Optional) The database engine version. Updating this argument results in an outage."
  default     = null
}

variable "port" {
  type        = number
  description = "(Optional) The port on which the DB accepts connections"
  default     = 27017
}

variable "master_username" {
  type        = string
  description = " (Required unless a snapshot_identifier is provided) Username for the master DB user."
}

variable "master_password" {
  type        = string
  description = " (Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocDB Naming Constraints."
}

variable "apply_immediately" {
  type        = bool
  description = "(Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = false
}

variable "storage_encrypted" {
  type        = bool
  description = "(Optional) Specifies whether the DB cluster is encrypted. The default is false."
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true."
  default     = null
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = " (Optional) List of VPC security groups to associate with the Cluster"
  default = [

  ]
}

variable "db_subnet_group_name" {
  type        = string
  description = "(Optional) A DB subnet group to associate with this DB instance."
  default     = ""
}

variable "db_cluster_parameter_group_name" {
  type        = string
  description = "(Optional) A cluster parameter group to associate with the cluster."
  default     = ""
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "(Optional) List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler."
  default = [
    "audit",
    "profiler"
  ]
}

variable "deletion_protection" {
  type        = bool
  description = "(Optional) A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled."
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  description = "(Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = false
}

variable "snapshot_identifier" {
  type        = string
  description = "(Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot."
  default     = null
}

variable "backup_retention_period" {
  type        = number
  description = "(Optional) The days to retain backups for. Default 1"
  default     = 1
}

variable "preferred_backup_window" {
  type        = string
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00"
  default     = "07:00-09:00"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "(Optional) The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made."
  default     = null
}

############ Cluster Instance #########

variable "cluster_size" {
  type        = number
  default     = 1
  description = "Number of DB instances to create in the cluster"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true."
  default     = true
}

variable "instance_class" {
  type        = string
  default     = "db.t3.medium"
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
}

variable "preferred_maintenance_window" {
  type        = string
  description = "(Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi"
  default     = "Mon:00:00-Mon:03:00"
}

variable "promotion_tier" {
  type        = number
  description = "(Optional) Default 0. Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoter to writer."
  default     = 0
}

### Parameters Group

variable "cluster_family" {
  type        = string
  description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
  default     = "docdb3.6"
}

variable "parameter" {
  type        = list(string)
  description = "List of DB parameters to apply"
  default = [

  ]
}
