terraform {
    required_providers {
        yandex = {
            source = "yandex-cloud/yandex"
            version = "<= 0.155"
        }
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.6"
        }
    }
}

provider "yandex" {
    token = var.token
    cloud_id = "b1gfju9irjmi29ag2kvk"
    folder_id = "b1g3ce2ml8s4bt24vm77"
    zone = "ru-central1-a"
}

data "yandex_compute_image" "deb_docker_img" {
    image_id = "fd8r3ffhck0j9bpcjt28"
}

resource "yandex_vpc_network" "test_net" {
    name = "test_net"
}

resource "yandex_vpc_subnet" "cool_subnet" {
    network_id = yandex_vpc_network.test_net.id
    v4_cidr_blocks = ["10.0.1.0/28"]
}

resource "yandex_compute_instance" "deb_vm" {
    boot_disk {
        auto_delete = true
        initialize_params {
          size = 10
          type = "network-hdd"
          image_id = data.yandex_compute_image.deb_docker_img.id
          block_size = 4096
        }
    }

    network_interface {
        subnet_id = yandex_vpc_subnet.cool_subnet.id
        nat = true
    }

    resources {
      cores = 2
      memory = 1
      core_fraction = 20
    }

    scheduling_policy {
      preemptible = true
    }

    metadata = {
        user-data = <<EOF
        #cloud-config
        users:
          - name: ritehist
            groups: [sudo, docker]
            shell: /bin/bash
            sudo: ['ALL=(ALL) NOPASSWD:ALL']
            ssh-authorized-keys:
              - ${file(var.ssh_path)}
        EOF
    }

    name = "deb-vm"
    platform_id = "standard-v3"
    hostname = "deb-vm"

}