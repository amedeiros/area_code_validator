require 'area_code_validator/version'
require 'config/area_code_config'
require 'extensions/area_code_invalid_validator' if defined?(Rails)

module AreaCodeValidator

  def self.invalid?(area_code, area_code_state)
    # Stop here and return true if either area_code or area_code_state are nil
    return true if area_code.nil? or area_code_state.nil?

    # Upcase and scrub the area_code and area_code_state
    area_code        = area_code.to_s.upcase.gsub(/(\W|[A-Z]|_)*/, '')
    area_code_state  = area_code_state.to_s.upcase.gsub(/(\W|\d|_)*/, '')

    # Stop here and return true if the state does not exist
    return true if !AreaCodeConfig::STATES.include?(area_code_state) and !AreaCodeConfig::STATES.values.include?(area_code_state)

    # Find the state abbreviation key we need to access our hash of arrays of area codes.
    key = get_abbreviation_key(area_code_state)

    # If the area code is in our list return false else return true
    return false if AreaCodeConfig::AREA_CODES[key].include?(area_code)
    true
  end


  # This is moved out into a method to make unit testing easier.
  def self.get_abbreviation_key(area_code_state)
    # If the area_code_state is greater than 2 then it is a full state name and we need to find the corresponding abbreviation for that state.
    key = ''
    if area_code_state.length > 2
      AreaCodeConfig::STATES.each do |k, v|
        key = k if v == area_code_state
      end
    else
      key = area_code_state # The area_code_state is already an abbreviated state
    end
    key
  end

  # inverse of invalid?
  def self.valid?(area_code, area_code_state)
    !invalid?(area_code, area_code_state)
  end
end
