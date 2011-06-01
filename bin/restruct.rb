puts File.dirname("restruct.rb")


puts File.directory?("restruct.rb")

dir = Dir.getwd

Dir['*'].sort.each do |name|
  puts name
  if File.directory?(name)
    puts "This is a directory"
  else
    puts "This is not a directory"
  end
end