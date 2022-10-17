resource "cloudflare_zone" "domain" {
  zone       = var.domain
  jump_start = true
}

resource "sendgrid_subuser" "subuser" {
  username = var.sendgrid_username
  email    = var.sendgrid_email
  password = var.sendgrid_password
  ips      = [var.sendgrid_ip]
}

resource "sendgrid_domain_authentication" "domain" {
  domain             = var.domain
  subdomain          = var.sub_domain
  automatic_security = true
  valid              = true
}

resource "cloudflare_record" "domain" {
  count   = 3
  zone_id = cloudflare_zone.domain.id
  name    = sendgrid_domain_authentication.domain.dns[count.index].host
  value   = sendgrid_domain_authentication.domain.dns[count.index].data
  type    = upper(sendgrid_domain_authentication.domain.dns[count.index].type)
  proxied = false
}

# Manually verify the domain via curl because the Terraform module doesn't support this yet.
resource "null_resource" "auth-verification" {
  provisioner "local-exec" {
    command = <<-EOT
      curl -s \
      -X POST 'https://api.sendgrid.com/v3/whitelabel/domains/${sendgrid_domain_authentication.domain.id}/validate' \
      --header 'Authorization: Bearer ${var.sendgrid_api_key}'
    EOT
  }

  depends_on = [cloudflare_record.domain]
}
