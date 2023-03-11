

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
apt -y install git default-jdk maven unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
key_id="YCAJEus89fiWBHOrnkx-Mun4b"
key="YCMRz-pjdf2X3JgBELUmpkgiEx-pr_8FoAbrpfTe"
region="ru-central1"
format="json"
aws configure set aws_access_key_id $key_id
aws configure set aws_secret_access_key $key
aws configure set region $region
aws configure set output $format
cd ~/ && git clone https://github.com/Elferey/my_box.git
cd ./my_box && mvn package
aws --endpoint-url=https://storage.yandexcloud.net/ \
  s3 cp /root/my_box/target/hello-1.0.war s3://elferey/hello

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
    user-data = <<EOF
#!/bin/bash

apt update
apt install -y tomcat9
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
key_id="YCAJEus89fiWBHOrnkx-Mun4b"
key="YCMRz-pjdf2X3JgBELUmpkgiEx-pr_8FoAbrpfTe"
region="ru-central1"
format="json"
aws configure set aws_access_key_id $key_id
aws configure set aws_secret_access_key $key
aws configure set region $region
aws configure set output $format
aws --endpoint-url=https://storage.yandexcloud.net \
  s3 cp s3://elferey/hello /var/lib/tomcat9/webapps
EOF
  }
}
