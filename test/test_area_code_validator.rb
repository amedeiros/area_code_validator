require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class AreaCodeValidatorTest < Test::Unit::TestCase
  context AreaCodeValidator do
    context '#invalid?' do

      Helper::VALID_AREA_CODES.each do |state, area_codes_array|
        area_codes_array.each_with_index do |area_code, index|
          should "be a valid area code #{area_code} - #{state} index: #{index}" do
            assert !AreaCodeValidator.invalid?(area_code, state), state.inspect + ' ' + area_code.inspect
          end
        end
      end

      Helper::VALID_AREA_CODES.each do |state, area_codes_array|
        area_codes_array.each_with_index do |area_code, index|
          should "not be a valid area_code #{area_code} - #{state} index: #{index}" do
            assert AreaCodeValidator.invalid?(area_code + '123', state), state.inspect + ' ' + area_code + '123'
          end
        end
      end

      should 'return true for an undefined state abbreviation' do
        invalid = AreaCodeValidator.invalid?('123', 'QQ')
        assert invalid
      end

      should 'return true for an undefined full state name' do
        invalid = AreaCodeValidator.invalid?('123', 'BadState')
        assert invalid
      end

      should 'handle a state abbreviation with non-word characters' do
        state = '12}3 F (** __)L @ 5674``' # FL
        assert !AreaCodeValidator.invalid?(Helper::VALID_AREA_CODES['FL'].first, state)
      end

      should 'handle a full state name with non-word characters' do
        state = '12_3 F (** )L o # R ^ I !!!! DA @   907' # FLORIDA
        assert !AreaCodeValidator.invalid?(Helper::VALID_AREA_CODES['FL'].first, state)
      end

      should 'handle a state area_code with non-word characters and word characters' do
        area_code = 'F / @!!()_hd -=8  %$#1  ?.,;3' # 813
        assert !AreaCodeValidator.invalid?(area_code, 'FL')
      end

      should 'return true for a nil area code' do
        assert AreaCodeValidator.invalid?(area_code=nil, area_code_state='FL')
      end

      should 'return true for a nil area code state' do
        assert AreaCodeValidator.invalid?(area_code='813', area_code_state=nil)
      end
    end

    context '#get_abbreviation_key' do
      AreaCodeValidator::AreaCodeConfig::STATES.each do |state_abbreviation, state_name|
        should "return the correct state abbreviation #{state_abbreviation}" do
          assert_equal state_abbreviation, AreaCodeValidator.get_abbreviation_key(state_name)
        end
      end
    end
  end
end
