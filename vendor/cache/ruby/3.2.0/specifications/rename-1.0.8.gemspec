# -*- encoding: utf-8 -*-
# stub: rename 1.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "rename".freeze
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Morshed Alam".freeze]
  s.date = "2021-07-05"
  s.email = ["morshed201@gmail.com".freeze]
  s.homepage = "https://github.com/morshedalam/rename".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.6".freeze
  s.summary = "Rename your Rails application using a single command.".freeze

  s.installed_by_version = "3.4.6" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rails>.freeze, [">= 3.0.0"])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0.19.1"])
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
end
