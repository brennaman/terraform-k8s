variable "AZURE_SUBSCRIPTION_ID" {}
variable "AZURE_TENANT_ID" {}
variable "AZURE_CLIENT_IDnt_id" {}
variable "AZURE_CLIENT_SECRET_ID" {}

variable "azure_environment" {
  default = "public"
}

variable "environment"{
    default = "dev"
}

variable "region" {
  default = "us"
}

variable "prefix" {
  description = "This prefix will be included in the name of some resources."
  default     = "mydemo"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "eastus"
}

variable "location_key" {
  description = "The region where the virtual network is created."
  default     = "eus"
}