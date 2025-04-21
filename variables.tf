variable "Account_ID" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "prefix" {
  description = "Prefix for all the resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to create the resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs for creating the resources"
  type        = list(string)
}

variable "route_table_ids" {
  description = "List of Route Table IDs where the endpoints will be created"
  type        = list(string)
}

variable "private_ips" {
  description = "List of private IPs to assign to the EC2 instances"
  type        = list(string)
}

variable "internal" {
  description = "Boolean indicating whether the ALB is internal"
  type        = bool
}

variable "alb_subnets" {
  description = "List of Subnet IDs for the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "access_logs_bucket" {
  description = "S3 bucket for ALB logging"
  type        = string
}

variable "access_logs_prefix" {
  description = "Prefix for the ALB logs"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the Target Group"
  type        = number
}

variable "health_check_path" {
  description = "Health check path for the Target Group"
  type        = string
}

variable "desired_size" {
  description = "The desired number of nodes for the EKS node group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of nodes for the EKS node group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of nodes for the EKS node group"
  type        = number
}

variable "max_unavailable" {
  description = "The maximum number of nodes that can be unavailable during an update"
  type        = number
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "enable_cluster_log_types" {
  description = "Enable Cluster Logs"
  type        = list(string)
}

variable "efs_performance_mode" {
  description = "Performance mode of the EFS file system"
  type        = string
}

variable "efs_throughput_mode" {
  description = "Throughput mode of the EFS file system"
  type        = string
}

variable "server_name" {
  description = "Name of the EC2 instance"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID of the VPC"
  type        = string
}

variable "root_block_device" {
  description = "Root block device configuration"
  type = object({
    volume_size           = number
    volume_type           = string
    throughput            = optional(number)
    delete_on_termination = bool
  })
}

variable "persistent_block_device" {
  description = "Persistent block device configuration"
  type = object({
    volume_size           = number
    volume_type           = string
    throughput            = optional(number)
    delete_on_termination = bool
  })
}

variable "ec2_key_name" {
  description = "Key Pair of the EC2 Instance"
  type        = string
}

variable "iam_roles" {
  description = "List of IAM role ARNs to grant EKS access"
  type        = list(string)
}

variable "environment" {
  description = "The deployment environment (e.g. dev, uat, prod)"
  type        = string
}

variable "os_type" {
  description = "Operating system type: windows, amz2, al2023"
  type        = string
  validation {
    condition     = contains(["windows", "amz2", "al2023"], lower(var.os_type))
    error_message = "Allowed values for os_type are 'windows', 'amz2', 'al2023'."
  }
}
