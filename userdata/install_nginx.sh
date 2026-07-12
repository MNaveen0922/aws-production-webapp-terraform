#!/bin/bash

apt-get update -y

apt-get install -y nginx

systemctl enable nginx

systemctl start nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>AWS Production Web App</title>
<style>
body{
font-family:Arial;
background:#f4f4f4;
text-align:center;
padding-top:80px;
}
h1{
color:#232F3E;
}
p{
font-size:20px;
}
</style>
</head>
<body>

<h1>Welcome to AWS Production Web Application</h1>

<p>Provisioned using Terraform</p>

<p>Hosted on Amazon EC2</p>

<p>Behind an Application Load Balancer</p>

</body>
</html>
EOF