variable "domain" {
  type        = string
  description = "The domain name for the email."
}

variable "sub_domain" {
  type        = string
  default     = null
  description = "(Optional) The sub-domain for the email."
}

variable "sendgrid_ip" {
  type        = string
  description = "SendGrid IP address for the domain."
}

variable "sendgrid_api_key" {
  type        = string
  description = "API Key for Sendgrid."
}

variable "sendgrid_username" {
  type        = string
  description = "SendGrid username for the subuser assigned to the domain."
}

variable "sendgrid_password" {
  type        = string
  description = "SendGrid password for the subuser assigned to the domain."
}

variable "sendgrid_email" {
  type        = string
  description = "E-mail address of the subuser."
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account ID."
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token."
}
