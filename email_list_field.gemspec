# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_list_field/version'

Gem::Specification.new do |spec|
  spec.name          = "email_list_field"
  spec.version       = EmailListField::VERSION
  spec.date          = '2016-09-29'
  spec.authors       = ["Henrique Gubert"]
  spec.email         = ["guberthenrique@hotmail.com"]

  spec.summary       = %q{Produces email list fields for rails forms}
  spec.description   = %q{This gem provides helper functions that allows you to add email list fields to your forms in a rails app. It also provides helper functions to process the submitted data on the controllers.}
  spec.homepage      = "https://github.com/hsgubert/email_list_field"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', '>= 3.2', '< 6.0'
  spec.add_runtime_dependency 'taggle', '0.1.2'
  spec.add_runtime_dependency 'jquery-rails', '~> 4'
  spec.add_runtime_dependency 'jquery-ui-rails', '~> 5.0'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
