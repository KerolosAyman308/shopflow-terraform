variable "config" {
  type = object({
    ssh_key_path = string
    password     = string
    username     = string
  })
}

variable "acr_config" {
  type = object({
    login_server = string
    username     = string
    password     = string
  })
}
