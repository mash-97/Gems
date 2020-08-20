# run MashzTest
require 'rake/testtask'

desc "Run MashzTest"
task :run_MashzTest do
  puts("Running MashzTest")
  puts `ruby ./test/mashz_test.rb`
end

Rake::TestTask.new("test_mashz") do |t|
  t.pattern = 'test/*_test.rb'
  t.warning = true
end
