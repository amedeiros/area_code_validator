[![Build Status](https://travis-ci.org/amedeiros/area_code_validator.svg)](https://travis-ci.org/amedeiros/area_code_validator)

# Area Code Validator

Area Code Validator is a small gem that validates a phone numbers area code to a state.

Supports valid method from version >= 0.0.3

New active model validator starting with version >= 0.0.4

## Installation

Add this line to your application's Gemfile:

    gem 'area_code_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install area_code_validator

## Usage

State can be either abbreviation or full state name.

```ruby
AreaCodeValidator.invalid?('123', 'FL') => true
AreaCodeValidator.invalid?('813', 'FL') => false

AreaCodeValidator.valid?('123', 'FL') => false
AreaCodeValidator.valid?('813', 'FL') => true
```

Active model validator usage requires one field to have phone in the attribute name and one with state.
The following are all valid cell_phone, home_phone, work_phone etc.. The validator looks for one attribute to contain phone and another to contain state.

```ruby
# Are all valid use cases. One attribute containing state another phone.
validates :cell_phone, :state,          area_code_invalid: true
validates :home_phone, :state_az,       area_code_invalid: true
validates :work_phone, :florida_state,  area_code_invalid: true
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Andrew Medeiros, andrew@amedeiros.com, @_AndrewMedeiros
