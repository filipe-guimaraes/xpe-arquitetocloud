locals {
  subnet_definitions = [
    { name = "public-a",  prefix = "10.10.1.0/24", zone = "3" },
    { name = "public-b",  prefix = "10.10.2.0/24", zone = "2" },
    { name = "private-a", prefix = "10.10.11.0/24", zone = "3" },
    { name = "private-b", prefix = "10.10.12.0/24", zone = "2" }
  ]
}