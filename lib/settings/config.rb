module Settings
  class Config
    attr_reader :setting_resolver

    def change_setting_resolver_to(&value)
      @setting_resolver = value
    end
  end
end

