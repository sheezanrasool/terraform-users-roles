locals {
  iam_with_cli = {
    user1 = { name : "engine" }
    user2 = { name : "ci" }
  }
  iam_full_access = {
    user1 = { name : "JohnDoe" }
    user2 = { name : "AboubacarMaina" }
  }
}

variable "group_1" {
  description = "Group 1 Name"
  type        = string
  default = "group1"
}

variable "group_2" {
  description = "Group 2 Name"
  type        = string
  default = "group2"
}

