resource "aws_subnet" "private_subnet1" {
  vpc_id            = "${aws_vpc.project.id}"
  cidr_block        = "${var.private_cidr_block1}"
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = "${aws_vpc.project.id}"
  cidr_block        = "${var.private_cidr_block2}"
  availability_zone = "${var.region}b"
}

resource "aws_subnet" "private_subnet3" {
  vpc_id            = "${aws_vpc.project.id}"
  cidr_block        = "${var.private_cidr_block3}"
  availability_zone = "${var.region}c"
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.project.id}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.public_cidr_block1}"
  availability_zone       = "${var.region}a"
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.project.id}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.public_cidr_block2}"
  availability_zone       = "${var.region}b"
}

resource "aws_subnet" "public_subnet3" {
  vpc_id                  = "${aws_vpc.project.id}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.public_cidr_block3}"
  availability_zone       = "${var.region}c"
}



