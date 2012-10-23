# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "acread"
  gem.homepage = "http://github.com/yarmand/acread"
  gem.license = "MIT"
  gem.summary = %Q{An ActiveRecord Extension to deprecate attributes}
  gem.description = %Q{When you deprecate an attribute, acread can helps you in 3 ways :

1. helps you finding where you are using this attribute by creating glue to raise a `DeprecatedAttributeError`.
2. ignore this atribute when serializing the object through to_json, to_xml ...
3. helps your zero downtime migration by ignoring the attribute for objects already in memory when saving to database.}
  gem.email = "yann@harakys.com"
  gem.authors = ["yann ARMAND"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "acread #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
