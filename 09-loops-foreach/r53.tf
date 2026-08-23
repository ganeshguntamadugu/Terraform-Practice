resource "aws_route53_record" "expense_private_ip" {
  for_each = aws_instance.instance_terraform
  allow_overwrite = true
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.instance_terraform[each.key].private_ip]
}

resource "aws_route53_record" "expense_public_ip" {
  for_each = aws_instance.instance_terraform
  allow_overwrite = true
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records = [aws_instance.instance_terraform["frontend"].public_ip]
}