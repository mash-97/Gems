#! /usr/bin/ruby

require 'logger'
$LOG_FORMATS = {
  :default => proc {|*args| Logger.Formatter.new.call(*args)},
  :simple =>  proc {
    |severity, time, prog_name, message|
    "\n##{severity}: [#{time.year}:#{time.month}:#{time.day} :: #{time.hour} : #{time.min} : #{time.sec}] #{": "+prog_name if prog_name} \n:--> #{message}\n"
  }
}

$mashz_log = Logger.new($stdout)
$mashz_log.formatter = $LOG_FORMATS[:simple]
$mashz_log.level = Logger::WARN

module Mashz
  
  # Loads ruby files recursively and interactively inside the give directory path.
  def load_interactively(dir_path, interactively=false, tabs="")
      # dir_path = File.absolute_path(dir_path)
      return false if not Dir.exist?(dir_path)
	  regexp = /\.rb$/
	  
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

      puts()	if interactively
      puts(tabs+"#{File.basename(File.absolute_path(dir_path))}-->")	if interactively
      loadable_files.each{
        |filename|
        file_path = File.join(dir_path, filename)
        next if File.absolute_path(__FILE__) == File.absolute_path(file_path)
        puts(tabs+"\t"+"require #{filename} :: #{require(file_path)}")	if interactively
        require(file_path)	if not interactively
      }

      directories.each{|name|
        next if name=="." or name==".."
        path = File.join(dir_path, name)
        load_interactively(path, interactively, tabs+"\t")
      }
  end
end

include Mashz
Mashz::load_interactively(File.dirname(File.absolute_path(__FILE__)), false)
