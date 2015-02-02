module Settings
  heading Settings do
    heading 'specifying settings for an item' do
      class SomeTarget
        include Settings

        setting :mapper
      end

      subject =  SomeTarget.new

      proof 'adds an accessor for the setting' do
        subject.prove do
          respond_to?(:mapper) &&
            subject.respond_to?(:mapper=)
        end
      end
    end
  end
end
