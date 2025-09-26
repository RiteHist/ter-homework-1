provider "docker" {
    host = "ssh://ritehist@${yandex_compute_instance.deb_vm.network_interface[0].nat_ip_address}:22"
    ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_image" "mysql" {
    name = "mysql:8"
}

resource "random_password" "root_pass" {
    length = 16
}

resource "random_password" "user_pass" {
    length = 10
}

resource "docker_container" "mysql" {
    image = docker_image.mysql.image_id
    name = "mysql"
    ports {
        internal = 3306
        external = 3306
    }
    env = [
        "MYSQL_ROOT_PASSWORD=${random_password.root_pass.result}",
        "MYSQL_DATABASE=wordpress",
        "MYSQL_USER=wordpress",
        "MYSQL_PASSWORD=${random_password.user_pass.result}",
        "MYSQL_ROOT_HOST=\"%\""
    ]
}