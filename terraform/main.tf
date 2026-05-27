resource "azurerm_resource_group" "rg" {
    location   = "eastus"
    managed_by = null
    name       = "rg-enterprise-webapp-dev"
    tags       = {}
}

resource "azurerm_service_plan" "appserviceplan" {
    app_service_environment_id      = null
#    kind                            = "linux"
    location                        = "southeastasia"
    maximum_elastic_worker_count    = 1
    name                            = "asp-enterprise-linux-f1"
    os_type                         = "Linux"
    per_site_scaling_enabled        = false
    premium_plan_auto_scale_enabled = false
#    reserved                        = true
    resource_group_name             = "rg-enterprise-webapp-dev"
    sku_name                        = "F1"
    tags                            = {}
    worker_count                    = 1
    zone_balancing_enabled          = false
}

resource "azurerm_linux_web_app" "webapp" {
    app_settings                                   = {}
    client_affinity_enabled                        = false
    client_certificate_enabled                     = false
    client_certificate_exclusion_paths             = null
    client_certificate_mode                        = "Required"
#    default_hostname                               = "enterprise-webapp-akshay-ejd2cbcxgsczfbgb.southeastasia-01.azurewebsites.net"
    enabled                                        = true
    ftp_publish_basic_authentication_enabled       = false
    hosting_environment_id                         = null
    https_only                                     = true
#    id                                             = "/subscriptions/d835d752-d4c6-456b-84c2-a30b082dd265/resourceGroups/rg-enterprise-webapp-dev/providers/Microsoft.Web/sites/enterprise-webapp-akshay"
#    key_vault_reference_identity_id                = "SystemAssigned"
#    kind                                           = "app,linux"
    location                                       = "southeastasia"
    name                                           = "enterprise-webapp-akshay"
    public_network_access_enabled                  = true
    resource_group_name                            = "rg-enterprise-webapp-dev"
    service_plan_id                                = "/subscriptions/d835d752-d4c6-456b-84c2-a30b082dd265/resourceGroups/rg-enterprise-webapp-dev/providers/Microsoft.Web/serverFarms/asp-enterprise-linux-f1"
    tags                                           = {}
    virtual_network_backup_restore_enabled         = false
    virtual_network_subnet_id                      = null
    vnet_image_pull_enabled                        = false
    webdeploy_publish_basic_authentication_enabled = false
    zip_deploy_file                                = null

    auth_settings {
        additional_login_parameters    = {}
        allowed_external_redirect_urls = []
        default_provider               = null
        enabled                        = false
        issuer                         = null
        runtime_version                = null
        token_refresh_extension_hours  = 0
        token_store_enabled            = false
        unauthenticated_client_action  = null
    }

    site_config {
        always_on                                     = false
        api_definition_url                            = null
        api_management_api_id                         = null
        app_command_line                              = null
        container_registry_managed_identity_client_id = null
        container_registry_use_managed_identity       = false
        default_documents                             = [
            "Default.htm",
            "Default.html",
            "Default.asp",
            "index.htm",
            "index.html",
            "iisstart.htm",
            "default.aspx",
            "index.php",
            "hostingstart.html",
        ]
#        detailed_error_logging_enabled                = false
        ftps_state                                    = "FtpsOnly"
#        health_check_eviction_time_in_min             = 0
        health_check_path                             = null
        http2_enabled                                 = false
        ip_restriction_default_action                 = null
#        linux_fx_version                              = "NODE|22-lts"
        load_balancing_mode                           = "LeastRequests"
        local_mysql_enabled                           = false
        managed_pipeline_mode                         = "Integrated"
        minimum_tls_cipher_suite                      = null
        minimum_tls_version                           = "1.2"
        remote_debugging_enabled                      = false
        remote_debugging_version                      = null
        scm_ip_restriction_default_action             = null
        scm_minimum_tls_version                       = "1.2"
#        scm_type                                      = "None"
        scm_use_main_ip_restriction                   = false
        use_32_bit_worker                             = true
        vnet_route_all_enabled                        = false
        websockets_enabled                            = false
        worker_count                                  = 1

        application_stack {
            docker_image_name        = null
            docker_registry_url      = null
            docker_registry_username = null
            dotnet_version           = null
            go_version               = null
            java_server              = null
            java_server_version      = null
            java_version             = null
            node_version             = "22-lts"
            php_version              = null
            python_version           = null
            ruby_version             = null
        }
    }
}