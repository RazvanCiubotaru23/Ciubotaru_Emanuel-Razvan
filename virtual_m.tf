resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "vm-mtc-${count.index}"
  resource_group_name = azurerm_resource_group.proj.name
  location            = azurerm_resource_group.proj.location

  admin_username = "adminuser"
  admin_password = random_password.password.result

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  size = var.vm_size

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.vm_image
    version   = "latest"
  }

  computer_name                   = "hostname${count.index + 1}"
  disable_password_authentication = false

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.vm_docker_ip 
      user        = "adminuser"
      password    = random_password.password.result
    }

    inline = [
      /* Update system */
      "sudo apt-get update",
      /* Install azure cli */
      "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash || echo 'Azure CLI installation failed' >> /tmp/provision.log",
      /* Install Docker */
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker adminuser",

      "az acr login --name practica ",
      "docker pull practica.azurecr.io/sql",

      # /* Install ansible */
      # "sudo apt-get update",
      # "sudo apt install -y python3 python3-pip",
      # "pip3 install ansible --user",

      /* Log the completion of provisioning */
      "echo 'Provisioning completed' >> /tmp/provision.log"
    ]
  }
}