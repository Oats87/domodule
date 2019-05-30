# terraform {
#   backend "kubernetes" {
#     config_context = "docker-for-desktop"
#     namespace = "cattle-system"
#     key = "potato-thing1"
#     load_config_file = true
#     # service_account = true
#   }
# }


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

# Create a web server
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "${var.do_name}"
  region = "sfo2"
  size   = "s-1vcpu-1gb"
}

output "do_id" {
  value = "${digitalocean_droplet.web.id}"
}

output "ipv4_address {
  value = "${digitalocean_droplet.web.ipv4_address}"
}

output "do_money" {
  value = "${digitalocean_droplet.web.price_hourly}"
}

output "do_lock" {
  value = "${digitalocean_droplet.web.locked}"
}

output "do_volume" {
  value = "${digitalocean_droplet.web.volume_ids}"
}

