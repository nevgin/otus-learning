provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  disk_image_app  = "${var.disk_image_app}"
}

module "db" {
  source             = "../modules/db"
  public_key_path    = "${var.public_key_path}"
  disk_image_mongodb = "${var.disk_image_mongodb}"
}

module "firewall" {
  source        = "../modules/vpc"
  source_ranges = ["77.50.78.100/32"]
}
