resource "aws_security_group" "ingress-all-test" {
  name   = "allow-all-sg"
  vpc_id = module.vpc.vpc_id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [
    module.vpc
  ]
}
resource "aws_security_group" "ingress-web" {
  name   = "allow-web"
  vpc_id = module.vpc.vpc_id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
  ingress {
    security_groups = [aws_security_group.ingress-all-test.id]
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [
    module.vpc
  ]
}
resource "aws_security_group" "ingress-internal" {
  name   = "allow-internal-ssh"
  vpc_id = module.vpc.vpc_id
  ingress {
    security_groups = [aws_security_group.ingress-all-test.id]
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [
    module.vpc
  ]
}