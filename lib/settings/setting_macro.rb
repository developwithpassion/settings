module Settings
  class SettingMacro
    include ::Initializer

    initializer :name, :key

    def self.create(name, key=name)
      instance = new(name, key) 
    end

    def variable_name
      @variable_name ||= "@#{name}"
    end

    def define_accessor(base)
      var_name = variable_name
      the_name = name

      base.instance_eval do
        define_method(the_name) do
          instance_variable_get(var_name)
        end

        define_method("#{the_name}=") do |value|
          instance_variable_set(var_name, value)
        end
      end
    end

    def apply_to(base)
      define_accessor(base)
    end

    def set_value(instance, value)
      setter = "#{name}="
      instance.send(setter, value)
    end

    def set_value_with_resolver(instance, resolver)
      set_value(instance, resolver.call(key))
    end
  end
end
