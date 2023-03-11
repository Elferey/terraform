

resource "yandex_compute_instance" "vm-1" {
  name = "build"

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
    subnet_id = "e9b1hsqivfmdc1ncavj9"
    nat       = true
  }
  
    metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"
    user-data = "${file("./data/build_mvn")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "deploy"

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
    subnet_id = "e9b1hsqivfmdc1ncavj9"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_key_ssh.pub")}"
    user-data = "${file("./data/tomcat")}"
  }
}
