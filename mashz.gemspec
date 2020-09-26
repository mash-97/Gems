#! /usr/bin/ruby
Gem::Specification.new do |spec|
	spec.name = "mashz"
	spec.version = "0.2.0"
	spec.platform = Gem::Platform::RUBY
	spec.authors = ["mash97"]
	spec.email = ["mahimnhd97@gmail.com"]
	
	
	spec.summary = "Extends some shortcut methods to the standard classes"
	spec.description = "Adds some shortcut methods and some programs based on file operations."
	spec.homepage = "https://github.com/mash-97/mashz"
	spec.license = "Nonstandard"
	
	
	spec.files = Dir["lib/**/*"]
	spec.bindir = 'bin'
	spec.executables = ['mashz']
	spec.require_paths = ['lib']
	spec.required_ruby_version = ">=2.3"
	
	
	spec.metadata["source_code_uri"] = "https://github.com/mash-97/mashz"
end

