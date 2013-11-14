class ConfigLoader
  def self.load_config tag, env=Rails.env
    puts "DEBUG: tag: #{tag}, env: #{env}"
    tag = tag.to_s
    if keys_for_tag? tag
      HashWithIndifferentAccess[config_for_tag tag]
    else
      self.load_yml_config "config/#{tag}.yml", env
    end
  end

  def self.load_yml_config file, env
    config = YAML.load_file(File.join Rails.root, file).with_indifferent_access
    raise "Missing '#{env}' config in #{file}" if config[env].blank?
    config[env]
  end

  def self.keys_for_tag tag
    ENV.keys.select do |key|
      key.start_with? tag.upcase
    end
  end

  def self.keys_for_tag? tag
    keys_for_tag(tag).any?
  end

  def self.config_for_tag tag
    keys_for_tag(tag).map do |key|
      [key.gsub("#{tag.upcase}_",'').downcase, ENV[key]]
    end
  end
end
