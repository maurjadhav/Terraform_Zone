# public ip address for load balancer
resource "azurerm_public_ip" "this" {
  name                = "lb-pip"
  location            = azurerm_network_security_group.this.location
  resource_group_name = azurerm_network_security_group.this.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_lb" "this" {
  name                = "preschool-lb"
  location            = azurerm_network_security_group.this.location
  resource_group_name = azurerm_network_security_group.this.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "preschool-lb-ip"
    public_ip_address_id = azurerm_public_ip.this.id
  }
depends_on = [ azurerm_public_ip.this ]
}



resource "azurerm_lb_backend_address_pool" "this" {
  name               = "preschool-pool"
  loadbalancer_id    = azurerm_lb.this.id
  virtual_network_id = azurerm_virtual_network.this.id
}

resource "azurerm_lb_probe" "this" {
  loadbalancer_id     = azurerm_lb.this.id
  name                = "preschool-probe"
  protocol            = "Http"
  port                = 80
  probe_threshold     = 2
  interval_in_seconds = 5
  request_path        = "/"
}

resource "azurerm_lb_rule" "this" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.this.id
  frontend_ip_configuration_name = azurerm_lb.this.frontend_ip_configuration[0].name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this.id
}
