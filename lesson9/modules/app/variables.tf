variable public_key_path {
	description = "Path to the public key used for ssh access"
	default = "~/.ssh/appuser.pub"
}
variable disk_image_app {
	description = "Disk image"
	default = "reddit-app-1543355655"
}
variable zone_app {
	description = "Zone"
	default  = "europe-west1-b"

}

variable open_port {
  description = "Open port"
	default = "9292"

}
