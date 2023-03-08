terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "default-ru-central1-b"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
}