resource "aws_docdb_cluster" "this" {
  count = var.enabled ? 1 : 0

  cluster_identifier = var.name

  engine         = var.engine
  engine_version = var.engine_version
  port           = var.port

  master_username = var.master_username
  master_password = var.master_password


  apply_immediately = var.apply_immediately
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.storage_encrypted ? var.kms_key_id : null

  vpc_security_group_ids          = var.vpc_security_group_ids
  db_subnet_group_name            = local.db_subnet_group_name
  db_cluster_parameter_group_name = local.db_cluster_parameter_group_name

  # checkov:skip=CKV_AWS_85:Logs are enabled bydefault
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  snapshot_identifier = var.snapshot_identifier
  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot

  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  final_snapshot_identifier = var.final_snapshot_identifier

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
################################# Cluster Instance  #####################
resource "aws_docdb_cluster_instance" "this" {
  count              = var.enabled ? var.cluster_size : 0
  identifier         = format("%s-%d", var.name, count.index + 1)
  cluster_identifier = var.name
  # checkov:skip=CKV_AWS_74:This is enabled at Cluster level
  promotion_tier               = var.promotion_tier
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  instance_class               = var.instance_class
  preferred_maintenance_window = var.preferred_maintenance_window
  engine                       = var.engine
  tags = merge(
    {
      Name = format("%s-%d", var.name, count.index + 1)
    },
    var.tags
  )
  depends_on = [
    aws_docdb_cluster.this
  ]
}
################### Subnet Group #######################################
resource "aws_docdb_subnet_group" "this" {
  count       = var.enabled && var.db_subnet_group_name == "" ? 1 : 0
  name        = format("%s", var.name)
  description = "Allowed subnets for DB cluster instances"
  subnet_ids  = var.subnet_ids
  tags = merge(
    {
      Name = format("%s", var.name)
    },
    var.tags
  )
}

resource "aws_docdb_cluster_parameter_group" "this" {
  count = var.enabled && var.db_cluster_parameter_group_name == "" ? 1 : 0

  name        = format("%s", var.name)
  description = format("DB cluster parameter group for %s", var.name)
  family      = var.cluster_family

  dynamic "parameter" {
    for_each = var.parameter
    content {
      apply_method = lookup(parameter.value, "apply_method", "pending-reboot")
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = merge(
    {
      Name = format("%s", var.name)
    },
    var.tags
  )
}
