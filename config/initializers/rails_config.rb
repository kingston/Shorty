# Load configuration before initializers

# Checks for the presence of database.yml
if !File.exist?("#{Rails.root}/config/database.yml")
  abort "ERROR: database.yml missing.  Please copy config/database.template.yml to config/database.yml and configure it for your machine."
end

# Check for a local.yml file
if !File.exist?(Rails.root.join("config", "settings.local.yml").to_s)
  abort "ERROR: local.yml missing.  Please copy config/settings/local.template.yml to config/settings/local.yml and configure it for your machine."
end

RailsConfig.setup do |config|
  config.const_name = "Settings"
end

