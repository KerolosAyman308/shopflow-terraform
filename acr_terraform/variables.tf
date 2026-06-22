variable "resource_group" {
  type = object({
    name = string
    loc  = string
  })
}

variable "config" {
  type = object({
    registry_name = string
    token_name    = string
  })
}
