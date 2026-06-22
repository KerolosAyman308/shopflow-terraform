
terraform {
  backend "azurerm" {
    storage_account_name = "terraformkoko"
    access_key           = "KmzcG+9qW/hKEKPwfoc6twf22h89eCwy+nqw2TIwujVf4Lzrccfh4ZgRkuVYOYHVlJTX8hGJxL3f+AStaW6S7Q=="
    container_name       = "tfstate"           # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
