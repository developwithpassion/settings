module Settings
  describe SettingMacro do
    class MyClass

    end

    context 'setting the value on an instance' do
      let(:subject) { SettingMacro.create(:first_name)}
      let(:the_klass) { Class.new do;end }

      before (:each) do
        subject.apply_to(the_klass)
        @instance = the_klass.new
      end

      before (:each) do
        subject.set_value(@instance, 'JP')
      end
      
      it 'initializes the value of the variable on the target instance' do
        expect(@instance.first_name).to eql('JP')
      end
    end

    context 'settings its value using a provided setting resolver' do
      let(:resolver) { ->(key) {
        expect(key).to eql(:first_name)
        'JP'
      }}
      let(:subject) { SettingMacro.create(:first_name)}
      let(:the_klass) { Class.new do;end }

      before (:each) do
        subject.apply_to(the_klass)
        @instance = the_klass.new
      end


      before (:each) do
        subject.set_value_with_resolver(@instance, resolver)
      end
      
      it 'initializes the value of the variable to the value received from the resolver' do
        expect(@instance.first_name).to eql('JP')
      end
    end
  end
end
