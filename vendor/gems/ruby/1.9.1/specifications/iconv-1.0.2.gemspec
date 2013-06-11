# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "iconv"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["NARUSE, Yui"]
  s.date = "2013-02-15"
  s.description = "iconv wrapper library"
  s.email = ["naruse@airemix.jp"]
  s.extensions = ["ext/iconv/extconf.rb"]
  s.files = ["ext/iconv/extconf.rb"]
  s.homepage = "https://github.com/nurse/iconv"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "1.8.23"
  s.summary = "iconv wrapper library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
