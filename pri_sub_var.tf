variable "pricidr" {
    description = "private subnet cidr"
    default = "10.0.3.0/24"
}

variable "pri_av_zone" {
    description = "private subnet Availability zone"
    default = "us-east-1a"
}

variable "pri_name" {
    description = "private subnet Name"
    default = "Demo_Private_subnet"
}