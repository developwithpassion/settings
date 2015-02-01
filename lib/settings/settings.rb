module Settings
  def self.included(base)
    base.extend ClassMethods
  end

  def settings
    self.class.settings
  end

  module ClassMethods
    def settings 
      @settings ||= []
    end

    def setting(name, key=name)
      setting_macro = SettingMacro.create(name, key)
      settings.push(setting_macro)
      setting_macro.apply_to(self)
    end
  end
end
