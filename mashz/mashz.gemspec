#! /usr/bin/ruby
Gem::Specification.new do |spec|
	spec.name = "mashz"
	spec.version = "0.0.1"
	spec.summary = "Some extended useful ruby features (modified class, methods, modules)."
	spec.platform = Gem::Platform::RUBY
	spec.files = Dir.glob("**/**/**")
	spec.test_files = Dir.glob("test/*_test.rb")
	spec.author = "Mash97"
	spec.email = "mahimnhd97@gmail.com"
	spec.has_rdoc = false
	spec.required_ruby_version = ">=2.0.0"
end

