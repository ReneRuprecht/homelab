# output "terraform_backend_config" {
#   value = {
#     endpoint   = var.minio_server
#     bucket     = minio_s3_bucket.terraform_state.bucket
#     access_key = minio_iam_user.terraform.name
#     secret_key = random_password.terraform_user.result
#   }
#
#   sensitive = true
# }
