variable project {
  description = "Project ID"
  default     = "infra-223321"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/appuser.pub"
}

variable disk_image_mongodb {
  description = "Disk image"
  default     = "mongodb-1543355346"
}

variable disk_image_app {
  description = "Disk image"
  default     = "reddit-app-1543355655"
}
