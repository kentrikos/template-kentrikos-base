output "jenkins_web_login" {
  value = "${module.jenkins.jenkins_web_login}"
}

output "jenkins_web_password" {
  value = "${module.jenkins.jenkins_web_password}"
}

output "jenkins_web_url" {
  value = "${module.jenkins.jenkins_web_url}"
}

output "jenkins_private_ip" {
  value = "${module.jenkins.jenkins_private_ip}"
}

output "jenkins_username" {
  value = "${module.jenkins.jenkins_username}"
}

output "jenkins_ssh_connection" {
  value = "${module.jenkins.ssh_connection}"
}

output "jenkins_ssh_private_key" {
  value     = "${module.jenkins.ssh_private_key}"
  sensitive = true
}
