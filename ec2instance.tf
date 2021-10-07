resource "aws_instance" "myweb-server" {
  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"
  tags = {
    Name = "myweb-server"
  }

  #VPC
  subnet_id = aws_subnet.dev-subnet-public-1.id
  #Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.uswest2.id

  # nginx installation
  provisioner "file" {
    source      = "nginx.sh"
    destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }

  connection {
    user        = var.EC2_USER
    host        = self.public_ip
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }
}

#Sends public key to the instance
resource "aws_key_pair" "uswest2" {
  key_name   = "uswest2"
  public_key = file(var.PUBLIC_KEY_PATH)
}
