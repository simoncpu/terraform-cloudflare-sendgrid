terraform {
  required_providers {
    sendgrid = {
      source  = "taharah/sendgrid"
      version = "0.2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.25"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.1"
    }
  }
}

provider "cloudflare" {
  api_token  = var.cloudflare_api_token
}

provider "sendgrid" {
  api_key = var.sendgrid_api_key
}
