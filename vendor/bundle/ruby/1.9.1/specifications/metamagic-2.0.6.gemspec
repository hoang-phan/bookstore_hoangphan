# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "metamagic"
  s.version = "2.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lasse Bunk"]
  s.date = "2013-10-30"
  s.description = "Metamagic is a simple Ruby on Rails plugin for creating meta tags."
  s.email = ["lassebunk@gmail.com"]
  s.homepage = "http://github.com/lassebunk/metamagic"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Simple Ruby on Rails plugin for creating meta tags."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
