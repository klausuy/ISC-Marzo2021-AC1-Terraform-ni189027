#Intancia
resource "aws_instance" "ni-189027-e2" {
  ami                    = "ami-00e87074e52e6c9f9"
  instance_type          = "t2.micro"
  key_name               = "id_rsa"
  vpc_security_group_ids = [aws_security_group.acceso-ssh-sg.id,aws_security_group.acceso-http-sg.id]
  subnet_id              = aws_subnet.ni-189027-subnet.id
  provisioner "file" {
  source      = "./proxy-conf.conf"
  destination = "/etc/nginx/conf.d/proxy-conf.conf"

  connection {
    type     = "ssh"
    user     = "nisnardi"
    private_key = file("/home/nisnardi/.ssh/id_rsa")
    host     = self.public_ip
  }
}
  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "nisnardi"
    private_key = file("/home/nisnardi/.ssh/id_rsa")
    host     = self.public_ip
    }
    inline = [
      "sudo -i",
      "yum install -y epel-release",
      "yum install -y nginx",
      "systemctl enable nginx",
      "systemctl start nginx",
    ]
    }
  tags = {
    Name      = "ni-189027-e2"
    terraform = "True"

  }
}