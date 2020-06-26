resource "aws_internet_gateway" "ig_project" {
  vpc_id = "${aws_vpc.project.id}"
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.project.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig_project.id}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public_subnet1.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public_subnet2.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public_subnet3.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "ng_project" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public_subnet1.id}"
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.project.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ng_project.id}"
  }
}

resource "aws_route_table_association" "d" {
  subnet_id      = "${aws_subnet.private_subnet1.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "e" {
  subnet_id      = "${aws_subnet.private_subnet2.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "f" {
  subnet_id      = "${aws_subnet.private_subnet3.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}
