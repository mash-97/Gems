#! /usr/bin/ruby

module Mashz
  def load_interactively(dir_path, regexp = /\.rb$/, tabs="")
      # dir_path = File.absolute_path(dir_path)
      return false if not Dir.exists?(dir_path)

      loadable_files = Dir.entries(dir_path).select{
          |filename|
          file_path = File.join(dir_path, filename)
          filename.match?(regexp) and File.file?(file_path) and not File.symlink?(file_path)
      }.sort()

      directories = Dir.entries(dir_path).select{
          |filename|
          file_path = File.join(dir_path, filename)
          File.directory?(file_path) and not File.symlink?(file_path)
      }.sort()

      puts()
      puts(tabs+"#{File.basename(File.absolute_path(dir_path))}-->")
      loadable_files.each{
        |filename|
        file_path = File.join(dir_path, filename)
        next if File.absolute_path(__FILE__) == File.absolute_path(file_path)
        puts(tabs+"\t"+"require #{filename} :: #{require(file_path)}")
      }

      directories.each{|name|
        next if name=="." or name==".."
        path = File.join(dir_path, name)
        load_interactively(path, regexp, tabs+"\t")
      }
  end
end

include Mashz
Mashz::load_interactively(File.dirname(File.absolute_path(__FILE__)))
# puts("Loading extended classes: #{require_relative("./extended_classes.rb")}")
# puts("Loading featured programs: #{require_relative("./programs/programs.rb")}")
