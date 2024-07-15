resource "null_resource" "ping" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = azurerm_public_ip.mtc-pub_ip[0].ip_address
      user     = "adminuser"
      password = random_password.password.result
    }

    inline = [
      "ping -c 4 ${azurerm_public_ip.mtc-pub_ip[1].ip_address}",
      //"ping -c 4 ${azurerm_public_ip.mtc-pub_ip[2].ip_address}"
    ] 
   
  }

  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
}

output "vm1_ip" {
  value = azurerm_public_ip.mtc-pub_ip[0].ip_address
}

output "vm2_ip" {
  value = azurerm_public_ip.mtc-pub_ip[1].ip_address
}
output "vm3_ip" {
  value = azurerm_public_ip.mtc-pub_ip[2].ip_address
}