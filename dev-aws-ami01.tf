provider "aws" {
  region     = "${var.region}"
}

# Create the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-005bdb005fb00e791"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
      "${aws_security_group.allow_ssh_in.id}"
  ]
  key_name = "${var.keypair}"
  tags = {
    Name = "instance['instance']"
    DeployedBy = "Terraform"
  }
} # End resource

# Create the elastic IP
resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
} # End resource

# Create the security group
resource "aws_security_group" "allow_ssh_in" {
  name        = "allow_ssh_in"
  description = "Allow SSH inbound traffic"

  ingress {
    # SSH (change to whatever ports you need)
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["192.169.10.0/23","71.59.139.40/32"]
  }

  tags = {
    Name = "allow_ssh_in"
    description = "Terraform"
  }
} # End resource