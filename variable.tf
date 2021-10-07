variable "AWS_REGION" {
  default = "us-west-2"
}
variable "AMI" {
  type = map(string)
  default = {
    us-west-2 = "ami-0dd273d94ed0540c0"
  }
}

variable "PRIVATE_KEY_PATH" {
  default = "uswest2.pem"
}

variable "PUBLIC_KEY_PATH" {
  default = "uswest2.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
