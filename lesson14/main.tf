

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
  resources "yandex_storage_object" {
    access_key = "YCAJEus89fiWBHOrnkx-Mun4b"
    secret_key = "YCMRz-pjdf2X3JgBELUmpkgiEx-pr_8FoAbrpfTe"
    bucket = "elferey"
    key = "hello-1.0.war"
    source = "/root/my_box/target/hello-1.0.war"
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
    user-data = <<EOF
#!/bin/bash

apt update
apt install -y tomcat9
EOF
  }
}
