module Settings
  describe Factory do
    context 'creating an item with settings' do
      context 'and a setting resolver has been provided on the factory' do
        class ATarget
          include ::Initializer
          include Settings
          include Factory

          resolve_settings_with ->(key) { key.to_s }

          setting :mapper
          setting :name

          initializer :last_name
        end

        before (:each) do
          @result = ATarget.create('Boodhoo')
        end

        it 'returns a new instance of the klass with constructor logic run' do
          expect(@result.last_name).to eql('Boodhoo')
        end

        it 'settings should be initialized to values retrieved from the resolver' do
          expect(@result).to_not be_nil
          expect(@result.name).to eql('name')
          expect(@result.mapper).to eql('mapper')
        end
      end
      context 'and no setting resolver has been provided on the factory' do
        class SecondTarget
          include ::Initializer
          include Settings
          include Factory

          setting :name

          initializer :last_name
        end

        before (:each) do
          Settings::configure do |config|
            config.change_setting_resolver_to do |key|
              'JP'
            end
          end
          @result = SecondTarget.create('Boodhoo')
        end

        it 'returns a new instance of the klass with constructor logic run' do
          expect(@result.last_name).to eql('Boodhoo')
        end

        it 'settings should be initialized to values retrieved from the default resolver' do
          expect(@result).to_not be_nil
          expect(@result.name).to eql('JP')
        end
      end
    end
  end
end
