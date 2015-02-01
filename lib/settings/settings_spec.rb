module Settings
  describe Settings do
    context 'specifying settings for an item' do
      class SomeTarget
        include Settings

        setting :mapper
      end

      subject { SomeTarget.new }

      it 'adds an accessor for the setting' do
        expect(subject.respond_to?(:mapper)).to be_true
        expect(subject.respond_to?(:mapper=)).to be_true
      end
    end


  end
end
