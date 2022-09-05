variable "portas" {
  description = "portas que serão abertas no security group"
  type        = list(number)
  default     = [22, 80, 443, 8080]

}