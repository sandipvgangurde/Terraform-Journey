# Allow SSH and ICMP traffic
resource "google_compute_firewall" "allow_ssh_icmp" {
  name    = "allow-ssh-icmp"
  network = google_compute_network.custom_creation.name # Reference the correct custom VPC network

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  direction   = "INGRESS"          # Ingress rule (incoming traffic)
  priority    = 1000               # Optional: Set priority (lower number = higher priority)
  target_tags = ["allow-ssh-icmp"] # Optional: Apply this rule to instances with this tag

  source_ranges = ["0.0.0.0/0"]    # Allow traffic from anywhere (can be more restrictive)

  description = "Allow SSH and ICMP traffic"
}

# Deny ICMP traffic (Ping) to specific IP ranges
resource "google_compute_firewall" "deny_ssh_icmp" {
  name    = "deny-icmp"
  network = google_compute_network.custom_creation.name  # Reference the correct custom VPC network

  deny {
    protocol = "icmp"
  }

  direction   = "INGRESS"        # Ingress rule (incoming traffic)
  priority    = 1000             # Optional: Set priority (lower number = higher priority)
  source_ranges = ["0.0.0.0/0"]  # Deny ICMP from all sources (can be more restrictive)

  description = "Deny ICMP traffic"
}
