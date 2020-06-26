data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "state"
    values = ["available"]
  }
}
resource "aws_instance" "r1soft"        {
  depends_on = ["aws_efs_file_system.project"]
  instance_type               = "t2.micro"
  ami                         = "${data.aws_ami.amazon.id}"
  key_name                    = "${aws_key_pair.deployer.key_name}"
  associate_public_ip_address = "true"
  subnet_id                   = "${aws_subnet.public_subnet1.id}"
  vpc_security_group_ids      = ["${aws_security_group.allow_tls.id}"]
  provisioner   "file" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "ec2-user"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    source      = "./module/r1soft.repo"
    destination = "/tmp/r1soft.repo"
  },
  provisioner   "remote-exec" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "ec2-user"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo cp /tmp/r1soft.repo /etc/yum.repos.d/",
      "sudo yum install r1soft-cdp-enterprise-server -y",
      "sudo r1soft-setup --user admin --pass redhat --http-port 8080",
      "sudo /etc/init.d/cdp-server restart",
      "sudo yum -y install nfs-utils",
      "sudo service nfs start",
      "sudo mkdir /var/backups",
      "sudo chmod 777 /etc/fstab",
      "sudo echo '${aws_efs_file_system.project.dns_name} /var/backups efs defaults 0 0' >> /etc/fstab"
      # "sudo mount -t nfs ${aws_efs_file_system.project.dns_name}:/backups /var/backups"
     ]
  }
}


  resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.project.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
