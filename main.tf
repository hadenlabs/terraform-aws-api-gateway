module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.1"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  delimiter  = "${var._delimiter}"
  attributes = "${var._attributes}"
  tags       = "${var._tags}"
}
