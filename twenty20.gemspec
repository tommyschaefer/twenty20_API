# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twenty20/version'

Gem::Specification.new do |spec|
  spec.name          = "twenty20"
  spec.version       = Twenty20::VERSION
  spec.authors       = ["Alex Wheeler"]
  spec.email         = ["afwheeler92@gmail.com"]
  spec.summary       =  "explore twenty20" 
  spec.description   =  "API client to explore Twenty20"
  spec.homepage      = "https://github.com/alexwheeler/twenty20_API"
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.files = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', "~> 0.13"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.8"
  spec.add_development_dependency "webmock", "~>1.0"
  spec.add_development_dependency "vcr", "~>2.9"
  spec.add_development_dependency "activesupport"
end
