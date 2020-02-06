variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "axial-radius-249202"
}

variable "names" {
  description = "Names of the buckets to create."
  type        = list(string)
  default     = ["test"]
}

variable "prefix" {
  description = "Prefix used to generate bueckt names."
  type        = string
  default     = "sri"
}

variable "bucket_policy_only" {
  description = "Disable ad-hoc ACLs on specified buckets. Defaults to true. Map of lowercase unprefixed name => boolean"
  type        = map(string)
  default     = { testgoogle: "false" }
  
}
