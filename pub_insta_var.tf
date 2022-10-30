variable "tag_name" {
    description = "Name of ec2 instance"
    default = "Static_public_instance"
}

variable "ami_id" {
    description = "AMI for ubuntu ec2 Instance"
    default = "ami-0149b2da6ceec4bb0"
}
variable "instance_type" {
    description = "Instance type"
    default = "t2.micro"
}

variable "key_name" {
    description = "SSH key"
    default = "mykey"
}