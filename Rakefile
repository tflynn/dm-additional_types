require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'find'

name = 'dm-additional_types'
version = '0.9.3'

gem_spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.summary = %{Addtional Data types for DataMapper}
  s.description = %{Addtional DataMapper Data types - DateTimeNoTZ}
  s.author = "Tracy Flynn"
  #s.email = ""
  #s.homepage = ""

  s.test_files = FileList['test/**/*']

  s.files = FileList['lib/**/*.rb', 'README', 'doc/**/*.*']
  s.require_path = 'lib'
#  s.autorequire = "dm-acts_as_contant"
  # These next two are patches for datamapper 0.9.3 dependency problems
  s.add_dependency("facets","2.4.1")
  s.add_dependency("english","0.2.0")
  s.add_dependency("dm-core", "0.9.3")
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

desc "Run test code"
Rake::TestTask.new(:default) do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :install => [:package] do
  sh %{gem install pkg/#{name}-#{version}.gem}
end

task :uninstall do
  sh %{gem uninstall #{name}}
end
