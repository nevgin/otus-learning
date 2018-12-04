variable public_key_path {
	description = "Path to the public key used for ssh access"
	default = "~/.ssh/appuser.pub"
}
variable disk_image_mongodb {
	description = "Disk image"
	default = "mongodb-1543355346"
}
variable zone_app {
	description = "Zone app"
	default = "europe-west1-b"
}
variable open_port {
	description = "Open port"
	default = "27017"
}

