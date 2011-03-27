app_config_hash = YAML.load_file(Rails.root.join("config/settings.yml"))[Rails.env].symbolize_keys rescue {}
SETTINGS = app_config_hash.to_openstruct
