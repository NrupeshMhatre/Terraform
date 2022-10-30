variable "tag_names" {
    description = "Name of ec2 instance"
    default = "Static_private_instance"
}

variable "ami_idd" {
    description = "AMI for ubuntu ec2 Instance"
    default = "ami-0149b2da6ceec4bb0"
}
variable "instance_types" {
    description = "Instance type"
    default = "t2.micro"
}

variable "key_names" {
    description = "SSH key"
    default = "mykey"
}