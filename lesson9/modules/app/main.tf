resource "google_compute_instance" "app" {
	name = "reddit-app"
	tags = ["reddit-app"]
	machine_type = "g1-small"
	zone = "${var.zone_app}"
	# определение загрузочного диска
	boot_disk {
		initialize_params {
			image = "${var.disk_image_app}"
		}
	}
	# определение сетевого интерфейса
	network_interface {
		# сеть, к которой присоединить данный интерфейс
		network = "default"
		# использовать ephemeral IP для доступа из Интернет
		access_config {
			nat_ip = "${google_compute_address.app_ip.address}"
		}
	}
	metadata {
		sshKeys = "appuser:${file(var.public_key_path)}"
	}
	connection {
		type = "ssh"
		user = "appuser"
		agent = false
		private_key = "${file("~/.ssh/appuser")}"
	}
	provisioner "file" {
		source = "../files/puma.service"
		destination = "/tmp/puma.service"
	}
	provisioner "remote-exec" {
		script = "../files/deploy.sh"
	}
}
resource "google_compute_firewall" "firewall_puma" {
	name = "allow-puma-default"
	# Название сети, в которой действует правило
	network = "default"
	# Какой доступ разрешить
	allow {
		protocol = "tcp"
		ports = ["${var.open_port}"]
	}
	# Каким адресам разрешаем доступ
	source_ranges = ["0.0.0.0/0"]
	# Правило применимо для инстансов с тегом ...
	target_tags = ["reddit-app"]
}
resource "google_compute_address" "app_ip" {
	name = "reddit-app-ip"
}
