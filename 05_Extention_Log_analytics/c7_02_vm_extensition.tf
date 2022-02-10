# Create VM extention for windows VM

resource "azurerm_virtual_machine_extension" "winvn-ext" {
  name                 = "winvm_monitoring_ext"
  virtual_machine_id   = azurerm_windows_virtual_machine.windowsvm.id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"

  settings           = <<SETTINGS
       {
         "workspaceId": "7919f243-275b-4634-8f42-65a87abdc676"
          }
       SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
      {
         "workspaceKey": "mAZP/YJZJA5Fb+EnyQaPvDfrHplRVmdxN19A8VkH2PxWaqeH/SRY3eSOrf3RS0bf+kI3q2sHaetX+qb8eZANEg=="
      } 
    PROTECTED_SETTINGS  
}


# Create VM extention for windows VM

resource "azurerm_virtual_machine_extension" "linuxvn-ext" {
  name                 = "winvm_monitoring_ext"
  virtual_machine_id   = azurerm_linux_virtual_machine.mgmtvm.id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.0"

  settings           = <<SETTINGS
       {
         "workspaceID" : "azurerm_log_analytics_workspace.test-workspace.workspace_id"
          }
       SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
      {
         "workspaceKey" : "azurerm_log_analytics_workspace.test-workspace.primary_shared_key"
      } 
    PROTECTED_SETTINGS  
}
