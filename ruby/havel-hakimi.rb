#!/usr/bin/env ruby

#Clean up arguments
def toi (input)
  new_list = []
  
  for arg in input
    new_list.push(arg.to_i)
  end
  
  return new_list
end

#Remove zeroes
def rem_z (input)
  arg = []
  
  for num in input
    if num.to_i != 0 then arg.push(num.to_i) end
  end
  
  return arg
end

#Descending sort
def des_s (input)
  return input.sort.reverse!
end

#Length check
def len_c (num, input)
  return num > input.length
end

#Front elimination
def front_e (num, input)
  arg = []
  
  for i in 0 ... num
    arg.push(input[i] - 1)
  end
  for i in num ... input.length
    arg.push(input[i])
  end
  
  return arg
end

#Havel-Hakimi algorithm
def main (input)
  arg = rem_z(input)
  
  if arg.length < 1 then return true end

  arg = des_s(arg)

  n = arg.shift

  if len_c(n, arg) then return false end

  arg = front_e(n, arg)

  main(arg)
end


puts main(toi(ARGV))
return 0
