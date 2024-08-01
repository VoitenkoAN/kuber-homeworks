///////////////////////////////////
///////////vpc network/////////////
///////////////////////////////////

# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }

# resource "yandex_vpc_subnet" "contlol-sub-a" {
#   name            = "contlol-subnet-a"
#   zone            = "ru-central1-a"
#   network_id      = yandex_vpc_network.develop.id
#   v4_cidr_blocks  = [var.subnet_cidr_blocks[0]]
# }

# resource "yandex_vpc_subnet" "work-subn-b" {
#   name            = "work-subnet-b"
#   zone            = "ru-central1-b"
#   network_id      = yandex_vpc_network.develop.id
#   v4_cidr_blocks  = [var.subnet_cidr_blocks[1]]
# }
