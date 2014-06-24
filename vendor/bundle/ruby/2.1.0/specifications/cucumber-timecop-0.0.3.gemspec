# -*- encoding: utf-8 -*-
# stub: cucumber-timecop 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "cucumber-timecop"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["zedtux"]
  s.date = "2013-11-30"
  s.description = "Timecop steps definition for Cucumber"
  s.email = ["zedtux@zedroot.org"]
  s.homepage = "https://github.com/zedtux/cucumber-timecop"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.1"
  s.summary = "Add this gem to the test group of you Gemfile in order to be able to travel in time in you Cucumber scenarios."

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, [">= 0"])
      s.add_runtime_dependency(%q<timecop>, [">= 0"])
      s.add_runtime_dependency(%q<chronic>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<chronic>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<chronic>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
