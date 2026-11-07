locals {
  user-data = "${file("~/.ssh/id_ed25519.pub")}"
}
