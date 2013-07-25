require 'area_code_validator/version'
require 'config/config'
require  'extensions/area_code_invalid_validator' if defined?(Rails)

module AreaCodeValidator

  def self.invalid?(area_code, area_code_state)
    # Upcase and scrub the area_code and area_code_state
    area_code        = area_code.to_s.upcase.gsub(/(\W|[A-Z]|_)*/, '')
    area_code_state  = area_code_state.to_s.upcase.gsub(/(\W|\d|_)*/, '')

    # Stop here and return true if the state does not exist
    return true, "Undefined state: #{area_code_state}" if !Config::STATES.include?(area_code_state) and !Config::STATES.values.include?(area_code_state)

    # Find the state abbreviation key we need to access our hash of arrays of area codes.
    key = get_abbreviation_key(area_code_state)

    # If the area code is in our list return false else return true
    return false if Config::AREA_CODES[key].include?(area_code)
    true
  end


  # This is moved out into a method to make unit testing easier.
  def self.get_abbreviation_key(area_code_state)
    # If the area_code_state is greater than 2 then it is a full state name and we need to find the corresponding abbreviation for that state.
    key = ''
    if area_code_state.length > 2
      Config::STATES.each do |k, v|
        key = k if v == area_code_state
      end
    else
      key = area_code_state # The area_code_state is already an abbreviated state
    end
    key
  end
end
