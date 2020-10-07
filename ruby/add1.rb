#!/usr/bin/env ruby

def main (input)
  num = input
  div = 1
  offset = 1
  output = 0

  while (num / div > 0)
    dig = num / div % 10

    output = output + (dig + 1) * div * offset
    div = div * 10
    
    if (dig > 8) then
      offset = offset * 10
    end
  end

  puts output
end

main(Integer(ARGV[0]))

return 0
