resource "google_compute_instance" "db" {
	name = "reddit-db"
	tags = ["reddit-db"]
	machine_type = "g1-small"
	zone = "${var.zone_app}"
	# определение загрузочного диска
	boot_disk {
		initialize_params {
			image = "${var.disk_image_mongodb}"
		}
	}
	# определение сетевого интерфейса
	network_interface {
		# сеть, к которой присоединить данный интерфейс
		network = "default"
		# использовать ephemeral IP для доступа из Интернет
		access_config {}
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
}
resource "google_compute_firewall" "firewall_db" {
	name = "allow-db-default"
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
	target_tags = ["reddit-db"]
	source_tags= ["reddit-app"]
}

