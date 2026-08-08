locals {
  #instance_id = "t3.micro"
  instance_id = var.environament == "prod" ? "t3.micro" : "t3.small" #We can keep expressions in locals
  sg_name = "Allow SSH"
}
