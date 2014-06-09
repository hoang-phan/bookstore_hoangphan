# -*- encoding: utf-8 -*-
# stub: appraisal 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "appraisal"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joe Ferris", "Prem Sichanugrist"]
  s.date = "2014-04-02"
  s.description = "Appraisal integrates with bundler and rake to test your library against different versions of dependencies in repeatable scenarios called \"appraisals.\""
  s.email = ["jferris@thoughtbot.com", "prem@thoughtbot.com"]
  s.executables = ["appraisal"]
  s.files = ["bin/appraisal"]
  s.homepage = "http://github.com/thoughtbot/appraisal"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.1"
  s.summary = "Find out what your Ruby gems are worth"

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0.14.0"])
      s.add_development_dependency(%q<activesupport>, [">= 3.2.13"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0.14.0"])
      s.add_dependency(%q<activesupport>, [">= 3.2.13"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0.14.0"])
    s.add_dependency(%q<activesupport>, [">= 3.2.13"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
  end
end
