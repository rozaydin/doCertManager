
locals {
  environment_file = file("${path.module}/scripts/.env")
  environment_list = split("\n", file("${path.module}/scripts/.env"))
  temp_lines = [
    for line in local.environment_list :
    split("=", trimspace(line))
  ]
  lines = [
    for line in local.temp_lines :
    line if length(line[0]) > 0 && substr(line[0], 0, 1) != "#"
  ]
  environment = {
    for line in local.lines : trim(line[0], "\"") => trim(line[1], "\"")
  }
  application_environment = merge(local.environment, { ".env" = local.environment_file })
}
