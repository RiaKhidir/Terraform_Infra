#Plain text secret
module "secrets-manager-1" {

  source = "lgallard/secrets-manager/aws"

  secrets = {
    secret-1 = {
      description             = "My secret 1"
      recovery_window_in_days = 7
      secret_string           = "This is an example"
    },
    secret-2 = {
      description             = "My secret 2"
      recovery_window_in_days = 7
      secret_string           = "This is another example"
    }
  }

  tags = {
    Owner       = "DevOps team"
    Environment = "dev"
    Terraform   = true

  }
}


#Key/Value secrets

module "secrets-manager-2" {

  source = "lgallard/secrets-manager/aws"

  secrets = {
    secret-kv-1 = {
      description = "This is a key/value secret"
      secret_key_value = {
        key1 = "value1"
        key2 = "value2"
      }
      recovery_window_in_days = 7
    },
    secret-kv-2 = {
      description = "Another key/value secret"
      secret_key_value = {
        username = "user"
        password = "topsecret"
      }
      tags = {
        app = "web"
      }
      recovery_window_in_days = 7
    },
  }

  tags = {
    Owner       = "DevOps team"
    Environment = "dev"
    Terraform   = true
  }
}