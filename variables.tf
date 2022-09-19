# primary harbor
variable "primary_harbor_username" {
  default = "admin"
}
variable "primary_harbor_password" {}
variable "primary_harbor_url" {}

#secondary harbor
variable "secondary_harbor_username" {
  default = "admin"
}
variable "secondary_harbor_password" {}
variable "secondary_harbor_url" {}

# robot
variable "robot_password_keeper_value" {
  default = 1
}

# auth
variable "config_auth" {
  default = false
}

#email
variable "config_email" {
  default = false
}
variable "email_username" {
  default = " "
}
variable "email_password" {
  default = " "
}
variable "email_host" {
  default = " "
}
