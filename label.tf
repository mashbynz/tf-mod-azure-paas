module "rg_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context    = var.context
  attributes = ["rg"]
  delimiter  = "-"
  #   tags               = { "random" = "face" }
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "log_analytics_workspace" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  # attributes         = ["analytics"]
  attributes         = [var.loganalytics_name]
  label_order        = ["attributes"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "activity_solution" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context = var.context
  # attributes         = ["AzureActivity(prodloganalytics-analytics)"]
  attributes         = [format("AzureActivity(%s)", "prodloganalytics-analytics")]
  label_order        = ["attributes"]
  delimiter          = ""
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}
