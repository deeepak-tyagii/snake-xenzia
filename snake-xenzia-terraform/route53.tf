#get the data of hosted zone in Route53
data "aws_route53_zone" "my_hosted_zone" {
  name         = var.domain_name
  private_zone = false
}

#Create the alias record for website subdomain
resource "aws_route53_record" "snake-xenzia-endpoint" {
  depends_on = [aws_s3_bucket_website_configuration.snake-xenzia-web]
  zone_id    = data.aws_route53_zone.my_hosted_zone.zone_id
  name       = var.bucket_name
  type       = "A"
  alias {
    name                   = "s3-website-${var.region}.amazonaws.com"
    zone_id                = aws_s3_bucket.snake-xenzia-bucket.hosted_zone_id
    evaluate_target_health = false
  }
}