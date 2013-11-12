class ConfigLoader
  def self.load_yml_config file, env
    config = YAML.load_file("#{Rails.root}#{file}").with_indifferent_access
    raise "Missing '#{env}' config in #{file}" if config[env].blank?
    config[env]
  end
end
