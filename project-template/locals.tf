locals {
  app_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
  }
}