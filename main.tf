resource "google_bigquery_routine_iam_member" "bigquery_routine_iam_members" {
  for_each = var.bigquery_routine_iam_members

  dataset_id = each.value.dataset_id
  member     = each.value.member
  role       = each.value.role
  routine_id = each.value.routine_id
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

