module Settings
  module Factory
    def self.included(base)
      base.extend ClassMethods
    end

    def create_klass(klass, *args, &block)
      self.class.create_klass(klass, *args, &block)
    end

    def populate_settings(instance)
      self.class.populate_settings(instance)
    end

    module ClassMethods
      def resolve_settings_with(setting_resolver)
        @setting_resolver = setting_resolver
      end

      def populate_settings(target)
        return unless target.class.respond_to?(:settings)
        settings = target.class.settings

        resolver = @setting_resolver || ::Settings.config.setting_resolver

        settings.each do |setting|
          setting.set_value_with_resolver(target, resolver)
        end

        target
      end

      def create(*args, &block)
        create_klass(self, *args, &block)
      end

      def create_klass(klass, *args, &block)
        instance = klass.send(:new, *args, &block)
        populate_settings(instance)
        instance
      end
    end
  end
end
