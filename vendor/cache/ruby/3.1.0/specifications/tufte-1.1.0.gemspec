# -*- encoding: utf-8 -*-
# stub: tufte 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tufte".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Max Holder".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-04-08"
  s.email = ["mxhold@gmail.com".freeze]
  s.executables = ["tufte".freeze]
  s.files = ["exe/tufte".freeze]
  s.homepage = "https://github.com/mxhold/tufte".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Blog/static site generator based on tufte-css".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.5"])
    s.add_runtime_dependency(%q<redcarpet>.freeze, ["~> 3.3"])
    s.add_runtime_dependency(%q<rouge>.freeze, ["~> 1.10"])
    s.add_runtime_dependency(%q<rack>.freeze, ["~> 1.6"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.5"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.3"])
    s.add_dependency(%q<rouge>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rack>.freeze, ["~> 1.6"])
  end
end
