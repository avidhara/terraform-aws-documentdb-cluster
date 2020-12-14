output "id" {
  description = "The DocDB Cluster Identifier"
  value       = join("", aws_docdb_cluster.this.*.id)
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the cluster"
  value       = join("", aws_docdb_cluster.this.*.arn)
}

output "cluster_members" {
  description = "List of DocDB Instances that are a part of this cluster"
  value       = aws_docdb_cluster.this.*.cluster_members
}

output "cluster_resource_id" {
  description = "The DocDB Cluster Resource ID"
  value       = join("", aws_docdb_cluster.this.*.cluster_resource_id)
}

output "endpoint" {
  description = "Endpoint of the DocumentDB cluster"
  value       = join("", aws_docdb_cluster.this.*.endpoint)
}

output "reader_endpoint" {
  description = "A read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
  value       = join("", aws_docdb_cluster.this.*.reader_endpoint)
}

############### Cluster Instance Outputs ##########
output "instances_arn" {
  description = "Amazon Resource Name (ARN) of cluster instance"
  value       = join("", aws_docdb_cluster_instance.this.*.arn)
}

output "ca_cert_identifier" {
  description = "(Optional) The identifier of the CA certificate for the DB instance"
  value       = join("", aws_docdb_cluster_instance.this.*.ca_cert_identifier)
}

############# subnet Group #############
output "subnet_group_id" {
  description = "ID of the DocumentDB cluster Security Group"
  value       = join("", aws_docdb_subnet_group.this.*.id)
}

output "subnet_group_arn" {
  description = " The ARN of the documentDB cluster parameter group.arn"
  value       = join("", aws_docdb_subnet_group.this.*.arn)
}

################# Paramaters Group ############
output "parameter_group_id" {
  description = "ID of the DocumentDB cluster Security Group"
  value       = join("", aws_docdb_cluster_parameter_group.this.*.id)
}

output "parameter_group_arn" {
  description = " The ARN of the documentDB cluster parameter group.arn"
  value       = join("", aws_docdb_cluster_parameter_group.this.*.arn)
}
