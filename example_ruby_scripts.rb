# IRB exercises
# Each Ruby command should return a value. Sometimes, these values are not as we expect.
# For example:
# $> string = "Hello World"
# $> string.reverse => "dloroW olleH"
# $> string => "Hello World"
#
# $> array = [3,1,2] => [3,1,2]
# $> array.sort => [1,2,3]
# $> array => [3,1,2]
#
# $> arr = [1,2,3]
# $> arr.each do |e|
# $>   puts e
# $> end
# $> => 1
# $> => 2
# $> => 3
# $> => [1,2,3]
#
# The ! operator lets us know we are doing a destructive operation, i.e. one that
# will change the original object. For example:
# $> arr = [3,1,2]
# $> arr.sort! => [1,2,3]
# $> arr => [1,2,3]

def is_triangle? args
  raise InputError "There are not 3 arguments" if args.length != 3
  array = args
  max = array.sort!.pop
  raise TriangleError "This is not a triangle" unless max >= array[0] + array[1]
  puts "Congratulations, you have found a triangle!"
end

def another_is_triangle_method args
  if args.length != 3
    raise InputError "There are not 3 arguments"
  end
  array = args
  max = array.sort!.pop
  unless max >= array[0] + array[1]
    raise TriangleError "This is not a triangle"
  else
    puts "Congratulations, you have found a triangle!"
  end
end


def reverse_string string
  string.reverse
end

def tedious_reverse_string string
  arr, reverse_arr = [], []
  arr = string.chars.to_a
  arr.length.times do
    reverse_arr << arr.pop
  end
end

def is_palindrome blob
  array = blob.to_s.chars.to_a
  if array.length % 2 == 1
    array.delete_at((array.length - 1 )/ 2)
  end
  left = array.slice(0..(array.length/2))
  right = array.slice((array.length/2)..-1)
  if left == right
    puts "Found a palindrome!"
  else
    raise PalindromeError "Not a Palindrome"
  end
end

Run the following Commands:

puts "Hello Ruby"
=> fill_in_what_irb_returns_here

array = [1,2,3,4]
=> fill_in_what_irb_returns_here

array.each do |e|
  e**2
end
=> fill_in_what_irb_returns_here

array
=> fill_in_what_irb_returns_here

array.map do |e|
  e**2
end
=> fill_in_what_irb_returns_here

array
=> fill_in_what_irb_returns_here

array = [1,2,3]

array.inject(0) do |sum, e|
  sum += e
  e
end
=> fill_in_what_irb_returns_here

array
=> fill_in_what_irb_returns_here

array.reject do |e|
  e > 2
end
=> fill_in_what_irb_returns_here

array
=> fill_in_what_irb_returns_here