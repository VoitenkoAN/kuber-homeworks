output "ansible_inventory" {
  value = templatefile("${path.module}/templates/inventory.tpl", {
    Control_node = yandex_compute_instance_group.controlnode.instances.*.network_interface.0.nat_ip_address
    Work_node = yandex_compute_instance_group.worknode_group.instances.*.network_interface.0.nat_ip_address
  })
}
