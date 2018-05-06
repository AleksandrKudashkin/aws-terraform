resource "aws_instance" "practice-server-1" {
  ami           = "ami-838b53fc"
  instance_type = "t2.micro"

  tags {
    Name = "practice-server-1"
    Use  = "demo win server"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.practice-server-1.private_ip} >> private_ips.txt"
  }
}

resource "aws_instance" "practice-server-2" {
  ami           = "ami-838b53fc"
  instance_type = "t2.micro"

  tags {
    Name = "practice-server-2"
    Use  = "demo win server"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.practice-server-1.id}"
}
