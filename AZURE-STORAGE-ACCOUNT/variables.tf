variable "location" {
  description = "region create resources"
  type        = string
  default     = "brazilsouth"

}

variable "account_tier" {
  description = "Tier from storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "REPLICATION TYPE STORAGE ACCOUNT"
  type        = string
  default     = "LRS"

}