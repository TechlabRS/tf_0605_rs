locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf pro-roboshop-shell-rs",
    "git clone https://github.com/TechlabRS/pro-roboshop-shell-rs",
    "cd pro-roboshop-shell-rs",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/TechlabRS/tf_0605_rs roboshop.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
  db_tags = {
    Name = "${var.component_name}-${var.env}"
  }
  app_tags = {
    Name      = "${var.component_name}-${var.env}"
    Monitor   = "true"
    component = var.component_name
    env       = var.env
  }
}


