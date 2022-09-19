output "replication_robot_name" {
  value = harbor_robot_account.replication-system-robot.full_name
}
output "replication_robot_secret" {
  sensitive = true
  value = harbor_robot_account.replication-system-robot.secret
}
