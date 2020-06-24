resource "aws_efs_file_system" "project" {
  creation_token = "my-project-april-2020-berkay" }

    resource "null_resource" "mine" {
    triggers = {
        always_run = "${timestamp()}"
    } 
  depends_on = ["aws_instance.r1soft"]
  depends_on = ["aws_efs_file_system"]
  provisioner   "remote-exec" {
    connection {
        host        = "${aws_instance.r1soft.public_ip}"
        type        = "ssh"
        user        = "ec2-user"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo yum -y install nfs-utils",
      "sudo service nfs start",
      "sudo mkdir /var/backups",
      "sudo mount -t nfs 3.85.49.232:/backups /var/backups",
    ]
  }
    }

  output "R1soft Username and Password" {
      value = "Username : admin Password : Redhat"
  }


