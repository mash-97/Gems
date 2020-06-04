
$workifyDir_desc = 
<<DESC
\t@workifyDir(dir_path, &block)\n
\t--> this method is used to yield the given block under terms of working with all the elements inside of the given dir_path.
\t--> returns the array of the elements inside of the dir_path 
\t--> returns false if the dir_path doesn't exist
DESC

def workifyDir(dir_path, &block)
	return false if not Dir.exists?(dir_path)
	
	Dir.foreach(dir_path) do |file_name|
		file_path = File.join(dir_path, file_name)
		
		next if file_name == "." or file_name == ".."
		
		workifyDir(file_path, &block) if File.directory?(file_path) 
		
		yield(file_path) if File.file?(file_path)
	end
end

