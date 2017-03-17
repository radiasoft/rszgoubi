variable "aws_region" {
    description = "The AWS region to create things in."
    default     = "us-east-1"
}

# Fedora 25 GP2 Base Cloud HVM AMIs
# https://alt.fedoraproject.org/cloud/
variable "aws_amis" {
    default = {
        "us-east-1" = "ami-56a08841"
    }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
