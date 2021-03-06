# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'area_code_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'area_code_validator'
  spec.version       = AreaCodeValidator::VERSION
  spec.authors       = ['Andrew Medeiros']
  spec.email         = ['andrew@amedeiros.com']
  spec.description   = %q{AreaCodeValidator is a small gem that validates a phone numbers area code to a state.}
  spec.summary       = %q{AreaCodeValidator is a small gem that validates a phone numbers area code to a state.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'rails', '~> 4.2.0'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'shoulda'
end
