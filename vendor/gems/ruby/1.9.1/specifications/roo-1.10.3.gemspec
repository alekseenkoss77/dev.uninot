# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "roo"
  s.version = "1.10.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Preymesser", "Hugh McGowan", "Ben Woosley"]
  s.date = "2013-03-04"
  s.description = "Roo can access the contents of various spreadsheet files. It can handle\n* Openoffice\n* Excel\n* Google spreadsheets\n* Excelx\n* Libreoffice\n* CSV"
  s.email = "thopre@gmail.com"
  s.executables = ["roo"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "bin/roo", "test/files/no_spreadsheet_file.txt", "website/index.txt"]
  s.files = ["bin/roo", "History.txt", "License.txt", "Manifest.txt", "test/files/no_spreadsheet_file.txt", "website/index.txt"]
  s.homepage = "http://roo.rubyforge.org/"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "roo"
  s.rubygems_version = "1.8.23"
  s.summary = "Roo can access the contents of various spreadsheet files."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.6"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.9"])
      s.add_development_dependency(%q<bones>, [">= 3.8.0"])
    else
      s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.6"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.9"])
      s.add_dependency(%q<bones>, [">= 3.8.0"])
    end
  else
    s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.6"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.9"])
    s.add_dependency(%q<bones>, [">= 3.8.0"])
  end
end
