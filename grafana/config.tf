terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
  token = "?"
  cloud_id  = "enpi7gartbkjdm67rrgr"
  folder_id = "b1gl0bm0dbk01pl1io4u"
}