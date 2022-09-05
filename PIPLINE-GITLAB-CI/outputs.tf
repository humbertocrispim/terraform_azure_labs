output "vm_ip_azure_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address

}

output "vm_ip_aws_ip" {
  value = aws_instance.vm.public_ip
}