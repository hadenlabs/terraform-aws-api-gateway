variable "name" {
  description = ""
}

variable "namespace" {}

variable "stage" {}

variable "_delimiter" {
  type    = "string"
  default = "-"
}

variable "_attributes" {
  type    = "list"
  default = []
}

variable "_tags" {
  type    = "map"
  default = {}
}

