class AreaCodeInvalidValidator < ActiveModel::Validator
  def validate(record)
    phone_key    = @options[:attributes].collect { |x| x if x.to_s.include?('phone') }.compact!.first
    state_key    = @options[:attributes].collect { |x| x if x.to_s.include?('state') }.compact!.first
    phone_number = record[phone_key].to_s
    state        = record[state_key].to_s
    record.errors.add(phone_key, "has an invalid area code for state #{state}") if AreaCodeValidator.invalid?(phone_number[0,3], state)
  end
end