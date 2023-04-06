"AZ"= {
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
}
"private_subnets"= {
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
}
"public_subnets"= {
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
}
"server"= {
    server1 = {
        name= "bastion_server",
        security_group= "${aws_security_group.ingress-all-test.id}",
        subnets= "${module.vpc.public_subnets{0}}"
    }
    server2= {
        name= "app_server",
        security_group= "${aws_security_group.ingress-internal.id}",
        subnets= "${module.vpc.private_subnets{0}}"
    }
    server3= {
        name= "web_server",
        security_group= "${aws_security_group.ingress-web.id}",
        subnets= "${module.vpc.public_subnets{1}}"
    }
}
