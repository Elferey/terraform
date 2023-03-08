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
  token: y0_AgAAAABZGe1BAATuwQAAAADeCfMBYvcXU_fSRgCQ3AHpBuENy16kaTk
}
