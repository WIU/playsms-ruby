require File.expand_path('lib/playsms/version', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name        = 'playsms'
  s.version     = Playsms::VERSION
  s.license     = 'MIT'
  s.platform = Gem::Platform::RUBY
  s.date        = '2016-12-13'
  s.summary     = 'This is the Ruby client library for PlaySMS\'s API.'
  s.description = 'PlaySMS Client Library for Ruby'
  s.files = Dir.glob('{lib,spec}/**/*') + %w(LICENSE.txt README.md playsms.gemspec)
  s.authors     = ['Matt Mencel']
  s.email       = 'mr-mencel@wiu.edu'
  s.homepage    = 'https://github.com/WIU/playsms-ruby'
  s.required_ruby_version = '>= 1.9.3'
  s.add_development_dependency('rake', '~> 11.0')
  s.add_development_dependency('minitest', '~> 5.0')
  s.add_development_dependency "rspec"

  if RUBY_VERSION == '1.9.3'
    s.add_development_dependency('addressable', '< 2.5.0')
    s.add_development_dependency('webmock', '~> 1.0')
  else
    s.add_development_dependency('webmock', '~> 2.0')
  end

  s.require_path = 'lib'
end
