# run MashzTest
require 'rake/testtask'
require 'rake/clean'

# clening test attempted files 
CLEAN.include("test/*.test_f")
CLEAN.include("test/rfg_test")

namespace :test do
	
	task :mashz do
	  puts("==> Running mashz_test:\n\n")
	  puts `ruby ./test/mashz_test.rb`
	  puts()
	end
	
	
	task :rfg => ["check:rfg_test_dir"] do
		puts("==>  Running rfg_test:\n\n")
		puts `ruby ./test/rfg_test.rb`
		puts()
	end
	
	task :all => [:mashz, :rfg, "clean:rfg_test_dir", "show:all_passed"]
	
end

namespace :show do 
	task :all_passed do 
		puts("All Passed!")
	end 
end 

namespace :check do

	task :rfg_test_dir do
		puts("Checking for rfg_test_dir: ")
		dir_path = File.join(File.absolute_path(__dir__), "test/rfg_test")
		if not Dir.exist?(dir_path) then
			puts("#{File.expand_path(dir_path, __dir__)} doesn't exist, so creating one")
			FileUtils.mkdir(dir_path)
			puts("Created!")
		else
			puts("#{File.expand_path(dir_path, __dir__)} exists!")
		end
		puts()
	end
	
end

namespace :clean do 
	task :rfg_test_dir do 
		puts("Removing rfg_test_dir: ")
		dir_path = File.join(File.absolute_path(__dir__), "test/rfg_test")
		if not Dir.exist?(dir_path) then
			puts("#{File.expand_path(dir_path, __dir__)} doesn't exist, so already done!")
		else
			FileUtils.rm_r(dir_path)
			puts("#{File.expand_path(dir_path, __dir__)} removed!")
		end
		puts()
	end 
end
		

Rake::TestTask.new(:test => ["clean:rfg_test_dir", "check:rfg_test_dir"]) do |t|
  t.pattern = 'test/*_test.rb'
  t.warning = true
end

