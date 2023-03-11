

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
    user-data = <<EOF
#!/bin/bash

apt -y update
apt -y install git default-jdk maven
cd ~/ && git clone https://github.com/Elferey/my_box.git
cd ./my_box && mvn package
EOF
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
    user-data = "${file("~/terraform/template/user-data")}"
  }
}
