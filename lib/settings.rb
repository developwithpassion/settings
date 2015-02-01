module Settings;end

require_relative 'settings/version'
require_relative 'settings/setting_macro'
require_relative 'settings/settings'
require_relative 'settings/config'
require_relative 'settings/factory'

module Settings
  def self.config
    @config ||= Config.new
  end

  def self.configure
    instance = Config.new
    yield instance
    @config = instance
  end
end
