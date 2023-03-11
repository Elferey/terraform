

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
    ssh-keys = "ssh-keys: elf1:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY5ofQ6GyZkHOPF9FOpUxWqnLc1TsI9SyHejELL/YkzGMhk5zbc7fM+OsZXsEVY78e1iZt8a7k6H2MJjF909xdKkl+wWL9sNcDEcf/Ril3ZclHREKbMqDQRcPKcFDPhdhrsoOEGGjbC7dfpX2LUwtyV9u9v1txD5ezAy951FXERsXpU1HeuN3X2j0BoHoiLQ7CZjmr0U82bD9cIjEdStF3HgdWDJe+cBGBZtNPlE311sIMjooPkkWwTyEf9acICw3UCxM/Mz9xu8t0jP/q5p2lp6IOsbfuKQI1FbMazwBHqBvCyfYOw8R8F/Dt8I+ut7Rx1a6kGCaQsjtyS8kWPTpsFE5WlEgmqCG2Bk9cxjfppNGd9+qXbQFWmBZiHem233TXIr246awnTC1c2Zi3BtTGh3ixIriYARAMjIR8BRNmu05dZDlaMfH/oYLGcFWfrZ5Gd+ybNTa24xFSp6DaRSwz/yqgLRikXphHhvYpyFDZCOpY46O/XNnvddk329cZETc= elf@Yanov"
    user-data = "${file("~/terraform/template/user-data")} && yc serverless function invoke d4eieher5evd7eu1gn8t"
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
    ssh-keys = "ssh-keys: elf1:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY5ofQ6GyZkHOPF9FOpUxWqnLc1TsI9SyHejELL/YkzGMhk5zbc7fM+OsZXsEVY78e1iZt8a7k6H2MJjF909xdKkl+wWL9sNcDEcf/Ril3ZclHREKbMqDQRcPKcFDPhdhrsoOEGGjbC7dfpX2LUwtyV9u9v1txD5ezAy951FXERsXpU1HeuN3X2j0BoHoiLQ7CZjmr0U82bD9cIjEdStF3HgdWDJe+cBGBZtNPlE311sIMjooPkkWwTyEf9acICw3UCxM/Mz9xu8t0jP/q5p2lp6IOsbfuKQI1FbMazwBHqBvCyfYOw8R8F/Dt8I+ut7Rx1a6kGCaQsjtyS8kWPTpsFE5WlEgmqCG2Bk9cxjfppNGd9+qXbQFWmBZiHem233TXIr246awnTC1c2Zi3BtTGh3ixIriYARAMjIR8BRNmu05dZDlaMfH/oYLGcFWfrZ5Gd+ybNTa24xFSp6DaRSwz/yqgLRikXphHhvYpyFDZCOpY46O/XNnvddk329cZETc= elf@Yanov"
    user-data = "${file("~/terraform/template/user-data")}"
  }
}
