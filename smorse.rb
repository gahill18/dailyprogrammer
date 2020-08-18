#!/usr/bin/env ruby

$arr = ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..".split

def encode_char (character)
  return $arr[character.ord - 97]
end

def encode (word)
  downcased_arr = word.downcase.split(//)
  output = ""

  downcased_arr.each { |character|
    output << encode_char(character)
  }

  return output
end

def file_mode (filename)
  file = File.open(filename)
  data = file.read.split("\n")
  file.close()
  
  new_data = Array.new()
  iter = 0
  
  data.each do |i|
    new_data[iter] = i << encode(i)
    iter = iter + 1
  end

  if File.exists?("encoded_enable1") then File.delete("encoded_enable1") end
  File.write("encoded_enable1", new_data.join("\n"), mode: "a")
  
  return 0
end

mode = ARGV[0]
file_or_word = ARGV[1]

if ARGV[0].eql?("file") && File.exists?(file_or_word) then
  file_mode(file_or_word)
  return 0
elsif ARGV[0].eql?("word") && file_or_word =~ /(a-zA-Z)*/ then
  encode(file_or_word)
  return 0
end

puts "Improper call, proper call is \"ruby smorse.rb [mode] [word/filename]\""
return 1
