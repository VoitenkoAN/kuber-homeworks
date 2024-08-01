data "yandex_compute_image" "ubuntu" {
  family = var.vm_name
}

resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/inventory.tpl",

    {
      Control_node = yandex_compute_instance_group.controlnode.instances.*.network_interface.0.nat_ip_address
      Work_node = yandex_compute_instance_group.worknode_group.instances.*.network_interface.0.nat_ip_address
    }
  )

  filename = "../playbook/inventory/inventory.yml"

}

resource "local_file" "hosts_mon" {
  content = templatefile("${path.module}/templates/inventory.tpl",

    {
      Control_node = yandex_compute_instance_group.controlnode.instances.*.network_interface.0.nat_ip_address
      Work_node = yandex_compute_instance_group.worknode_group.instances.*.network_interface.0.nat_ip_address
    }
  )

  filename = "../playbookMonitoring/inventory/inventory.yml"
  
}
