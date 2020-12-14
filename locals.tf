locals {
  db_subnet_group_name            = var.db_subnet_group_name != "" ? var.db_subnet_group_name : join("", aws_docdb_subnet_group.this.*.name)
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name != "" ? var.db_cluster_parameter_group_name : join("", aws_docdb_cluster_parameter_group.this.*.name)
}
