resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = b0cf7l8cff5r601343r8
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/terraform/template/user-data")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "terraform2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80d7fnvf399b1c207j"
    }
  }

  network_interface {
    subnet_id = b0cf7l8cff5r601343r8
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"
  }
}

