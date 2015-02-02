module Settings
  heading 'creating an item with settings' do
    heading 'and a setting resolver has been provided on the factory' do
      class ATarget
        include ::Initializer
        include Settings
        include Factory

        resolve_settings_with ->(key) { key.to_s }

        setting :mapper
        setting :name

        initializer :last_name
      end

      result = ATarget.create('Boodhoo')

      proof 'returns a new instance of the klass with constructor logic run' do
        result.prove do
          last_name === 'Boodhoo'
        end
      end

      proof 'settings should be initialized to values retrieved from the resolver' do
        result.prove do
          !nil? &&
            name == 'name' &&
            mapper == 'mapper'
        end
      end
    end
    heading 'and no setting resolver has been provided on the factory' do
      class SecondTarget
        include ::Initializer
        include Settings
        include Factory

        setting :name

        initializer :last_name
      end

      Settings::configure do |config|
        config.change_setting_resolver_to do |key|
          'JP'
        end
      end
      result = SecondTarget.create('Boodhoo')

      proof 'returns a new instance of the klass with constructor logic run' do
        result.prove { last_name == 'Boodhoo' }
      end

      proof 'settings should be initialized to values retrieved from the default resolver' do
        result.prove do
          !nil? &&
            name == 'JP'
        end
      end
    end
  end
end
