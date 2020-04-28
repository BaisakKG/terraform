variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {}
variable "region"{
    default = "us-east-1"
}

variable "network_address_space" {
    type = map(string)
}
variable "instance_size" {
  type = map(string)
}

variable "instance_count" {
    type = map(number)
}
variable "subnet_count" {
    type = map(number)
}


variable "bucket_name_prefix" {}
variable "billing_code_tag" {}
variable "environmet_tag" {}

variable "arm_subscription_id" {}
variable "arm_principal" {}
variable "arm_password" {}
variable "tenant_id" {}
variable "dns_zone_name" {}
variable "dns_resource_group" {}


###LOCAL

locals {
    env_name = lower(terraform.workspace)
    common_tags = {
        BillingCode = var.billing_code_tag
        Evironment = local.env_name
    }

    s3_bucket_name = "${var.bucket_name_prefix}-${local.env_name}-${random_integer.rand.result}"
}
