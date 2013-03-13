class TriangleError < StandardError
end

class PalindromeError < StandardError
end

def is_triangle? args
  raise ArgumentError, "There are not 3 arguments" if args.length != 3
  array = args
  max = array.sort!.pop
  raise TriangleError, "This is not a triangle" unless max <= array[0] + array[1]
  puts "Congratulations, you have found a triangle!"
end

def another_is_triangle_method args
  if args.length != 3
    raise ArgumentError, "There are not 3 arguments"
  end
  array = args
  max = array.sort!.pop
  unless max <= array[0] + array[1]
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
  left = array.slice(0..(array.length/2 - 1))
  right = array.slice((array.length/2)..-1)
  if left == right.reverse
    puts "Found a palindrome!"
  else
    raise PalindromeError, "Not a Palindrome"
  end
end