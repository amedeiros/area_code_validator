require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class PhoneTest < ActiveSupport::TestCase
  context 'active model validator' do
    context 'cell phone' do
      should 'be a valid cell phone' do
        phone = Phone.new(cell_phone: '8131234567', state: 'Florida')
        assert phone.valid?, phone.errors.full_messages.inspect
      end

      should 'be an invalid cell phone' do
        phone = Phone.new(cell_phone: '123456789', state: 'Florida')
        assert phone.invalid?, phone.errors.full_messages.inspect
      end
    end
  end
end
