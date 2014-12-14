# -*- encoding: utf-8 -*-
# stub: ruby-opencv 0.0.13 ruby lib
# stub: ext/opencv/extconf.rb

Gem::Specification.new do |s|
  s.name = "ruby-opencv"
  s.version = "0.0.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["lsxi", "ser1zw", "pcting"]
  s.date = "2014-03-30"
  s.description = "ruby-opencv is a wrapper of OpenCV for Ruby. It helps you to write computer vision programs (e.g. detecting faces from pictures) with Ruby."
  s.email = ["masakazu.yonekura@gmail.com", "azariahsawtikes@gmail.com", "pcting@gmail.com"]
  s.extensions = ["ext/opencv/extconf.rb"]
  s.extra_rdoc_files = ["DEVELOPERS_NOTE.md", "History.txt", "License.txt", "Manifest.txt", "README.md", "examples/facerec/readme.md"]
  s.files = ["DEVELOPERS_NOTE.md", "History.txt", "License.txt", "Manifest.txt", "README.md", "examples/facerec/readme.md", "ext/opencv/extconf.rb"]
  s.homepage = "https://github.com/ruby-opencv/ruby-opencv/"
  s.licenses = ["The BSD License"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubygems_version = "2.2.2"
  s.summary = "OpenCV wrapper for Ruby"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0"])
      s.add_development_dependency(%q<hoe-gemspec>, ["~> 0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.10"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0"])
      s.add_dependency(%q<hoe-gemspec>, ["~> 0"])
      s.add_dependency(%q<hoe>, ["~> 3.10"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0"])
    s.add_dependency(%q<hoe-gemspec>, ["~> 0"])
    s.add_dependency(%q<hoe>, ["~> 3.10"])
  end
end
