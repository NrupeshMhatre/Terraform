variable "pubcidr" {
    description = "public subnet cidr"
    default = "10.0.1.0/24"
}

variable "pub_av_zone" {
    description = "public subnet Availability zone"
    default = "us-east-1a"
}

variable "pub_name" {
    description = "public subnet Name"
    default = "Demo_Public_subnet"
}