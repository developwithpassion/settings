module Settings
  heading SettingMacro do
    class MyClass

    end

    heading 'setting the value on an instance' do
      subject = SettingMacro.create(:first_name)
      the_klass = Class.new do;end 

      subject.apply_to(the_klass)
      instance = the_klass.new

      subject.set_value(instance, 'JP')

      proof 'initializes the value of the variable on the target instance' do
        instance.prove { first_name == 'JP' }
      end
    end

    heading 'settings its value using a provided setting resolver' do
      Proof.start

      resolver = ->(key) do
        self.prove { key == :first_name }
        'JP'
      end

      subject = SettingMacro.create(:first_name)
      the_klass = Class.new do;end

      subject.apply_to(the_klass)
      instance = the_klass.new

      heading  'initializes the value of the variable to the value received from the resolver' do
        subject.set_value_with_resolver(instance, resolver)

        instance.prove do
          first_name == 'JP'
        end
      end

      Proof.stop
    end
  end
end
