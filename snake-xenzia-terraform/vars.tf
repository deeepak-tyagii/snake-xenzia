variable "region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type    = string
  default = "<your-domain"
}

variable "bucket_name" {
  type    = string
  default = "<bucket name should be same as your subdomain>"
}

variable "environment" {
  type    = string
  default = "test"
}

variable "resource-tag" {
  type    = string
  default = "snake-xenzia"
}

variable "object-key" {
  type    = string
  default = "index.html"
}

variable "github-repo" {
  type    = string
  default = "<github-repo-link"
}
