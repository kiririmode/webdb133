variable "bucket_name" {
  description = "S3バケット名"
  type        = string
}

variable "force_destroy" {
  description = "bucketが空でなくても、強制的にbucketを削除する"
  type        = bool
  default     = false
}

variable "hoge" {
  type = string
}

variable "fuga" {
  type = string
}
 