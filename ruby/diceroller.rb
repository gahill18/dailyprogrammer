#!/usr/bin/env ruby

def output_line(input)
  #if input follows correct pattern, then roll the dice
  if input =~ /[1-9]+[0-9]*d[2-9]+[0-9]*/ then
    puts "placeholder"
  else
    puts "Incorrect line format"
  end
end

#open the provided file, split it into lines, close the file, then
#calculate each line
def main (filename)
  file = File.open(filename)
  lines = file.read.split("\n")
  file.close

  lines.each do |line|
    output_line(line)
  end
  
  return 0
end

filename = ARGV[0]
if File.exists?(filename) then
  main(filename)
end

puts "File reader error, please try again"
return 1

