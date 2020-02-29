# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "settings"
  s.version     = '0.0.3'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ["Develop With Passion®"]
  s.email       = ["open_source@developwithpassion.com"]
  s.homepage    = "http://www.developwithpassion.com"
  s.summary     = %q{Really simple setting mechanism}
  s.description = %q{Simple setting mechanism}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
