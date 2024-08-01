resource "yandex_compute_instance_group" "worknode_group" {
  name                = "worknode-group"
  folder_id           = var.folder_id
  service_account_id  = var.svc_account_id
  deletion_protection = false
  instance_template {
    platform_id = "standard-v1"
    name        = "worknode-{instance.index}"
    hostname    = "worknode-{instance.index}"

    resources {
      cores         = var.vm_worknode_resources.cores
      memory        = var.vm_worknode_resources.memory
      core_fraction = var.vm_worknode_resources.core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        type     = "network-hdd"
        size     = var.vm_worknode_resources.size
      }
    }

    network_interface {
      network_id = yandex_vpc_network.develop.id
      subnet_ids = [yandex_vpc_subnet.contlol-sub-a.id, yandex_vpc_subnet.work-subn-b.id]
      nat        = true
    }

    metadata = {
      key_ssh   = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
      #  key_ssh    = "ubuntu:${local.key_ssh}"
    }
  }
  scale_policy {
    fixed_scale {
      size = var.spworknode_group
    }
  }

  allocation_policy {
    zones = ["ru-central1-b"]

  }
  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }
}

