# AreaCodeValidator

AreaCodeValidator is a small gem that validates a phone numbers area code to a state.

## Installation

Add this line to your application's Gemfile:

    gem 'area_code_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install area_code_validator

## Usage

State can be either abbreviation or full state name

```ruby
AreaCodeValidator.invalid?('123', 'FL') => true
AreaCodeValidator.invalid?('813', 'FL') => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
