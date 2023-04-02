resource "azurerm_virtual_network" "workgroup" {
  name                = "workgroup-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]
}

resource "azurerm_subnet" "workgroup" {
  name                 = "internal"
  resource_group_name  = var.resource_group["name"]
  virtual_network_name = azurerm_virtual_network.workgroup.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "workgroup2" {
  name                 = "internal2"
  resource_group_name  = var.resource_group["name"]
  virtual_network_name = azurerm_virtual_network.workgroup.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "workgroup" {
  count               = var.vm_info["count"]
  name                = "workgroup-nic-${count.index}"
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workgroup.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.workgroup.*.id, count.index)

  }
}

resource "azurerm_network_interface" "workgroup2" {
  count               = var.vm_info["count"]
  name                = "workgroup2-nic-${count.index}"
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]

  ip_configuration {
    name                          = "internal2"
    subnet_id                     = azurerm_subnet.workgroup2.id
    private_ip_address_allocation = "Dynamic"

  }
}

resource "azurerm_linux_virtual_machine" "workgroup" {
  name                = "${var.vm_info["workgroup"]}-vm-${count.index}"
  count               = var.vm_info["count"]
  resource_group_name = var.resource_group["name"]
  location            = var.resource_group["location"]
  size                = "Standard_DS1_v2"
  admin_username      = var.ssh_connection["ssh_user"]
  computer_name       = "${var.vm_info["workgroup"]}-vm-${count.index}"
  disable_password_authentication = true
  network_interface_ids = [
    element(azurerm_network_interface.workgroup.*.id, count.index)
, element(azurerm_network_interface.workgroup2.*.id, count.index)
  ]

  admin_ssh_key {
    username   = var.ssh_connection["ssh_user"]
    public_key = file(var.ssh_connection["ssh_key"])
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9_1"
    version   = "latest"
  }

}

resource "azurerm_public_ip" "workgroup" {
  count               = var.vm_info["count"]
  name                = "workgroup-vm-nic-0${count.index}"
  resource_group_name = var.resource_group["name"]
  location            = var.resource_group["location"]
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "workgroup" {
  name                = "workgroup-security-group1"
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_interface_security_group_association" "workgroup" {
    count               = var.vm_info["count"]
    network_interface_id      = element(azurerm_network_interface.workgroup.*.id, count.index)
    network_security_group_id = azurerm_network_security_group.workgroup.id
}