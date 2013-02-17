# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acread"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["yann ARMAND", "Nick Campbell"]
  s.date = "2013-02-17"
  s.description = "An ActiveRecord Extension to deprecate attributes"
  s.email = "yann@harakys.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".travis.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "acread.gemspec",
    "lib/acread.rb",
    "lib/acread/active_record_ext.rb",
    "lib/acread/continuable_raise.rb",
    "lib/acread/deprecatable.rb",
    "test/helper.rb",
    "test/test_acread.rb"
  ]
  s.homepage = "http://github.com/yarmand/acread"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "An ActiveRecord Extension to deprecate attributes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<continuable>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.4"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<continuable>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.4"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<continuable>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.4"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

