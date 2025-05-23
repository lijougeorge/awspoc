output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the ALB"
  value       = aws_lb.alb.zone_id
}

output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = aws_lb_target_group.alb_tg.arn
}