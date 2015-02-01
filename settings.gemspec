# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",__FILE__)
require "settings/version"

Gem::Specification.new do |s|
  s.name        = "settings"
  s.version     = Settings::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ["Develop With Passion®"]
  s.email       = ["open_source@developwithpassion.com"]
  s.homepage    = "http://www.developwithpassion.com"
  s.summary     = %q{Really simple setting mechanism}
  s.description = %q{Simple setting mechanism}
  s.rubyforge_project = "settings"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
