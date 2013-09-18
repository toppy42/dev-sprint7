
# Define class TriangleError as sub class of StandardError
class TriangleError < StandardError
end

# Define class PalindromeError as sub class of StandardError
class PalindromeError < StandardError
end

# define is_triangle? method
def is_triangle? args
  # throw error if not 3 arguments
  raise ArgumentError, "There are not 3 arguments" if args.length != 3
  # define array
  array = args
  # sort in place, then remove and return last item (largest)
  max = array.sort!.pop
  # Throw TriangleError exception if the sum of the other two items in array is smaller than largest
  raise TriangleError, "This is not a triangle" unless max <= array[0] + array[1]
  # Otherwise print confirmation
  puts "Congratulations, you have found a triangle!"
  # return should be the result of max <= array[0] + array[1]
end

# define another_is_triangle_method
def another_is_triangle_method args
  # Affirm there are exactly 3 arguments
  if args.length != 3
    # if not, throw error
    raise ArgumentError, "There are not 3 arguments"
  end
  # define array
  array = args
  # sort and pop the largest item
  max = array.sort!.pop
  # if max is greater than the sum of the other two items
  unless max <= array[0] + array[1]
    # throw error
    raise TriangleError, "This is not a triangle"
  else
    puts "Congratulations, you have found a triangle!"
  end
end


def reverse_string string
  string.reverse
end

# define a reverse string function using arrays rather than built in methods
def tedious_reverse_string string
  arr, reverse_arr = [], []
  # take string and convert to a character array
  arr = string.chars.to_a
  # get length of array and convert to a iteration counter for do loop
  arr.length.times do
    # pop last item off and put as next item in reverse_arr
    reverse_arr << arr.pop
  end
end

# define is_palindrome
def is_palindrome blob
  # convert blob to string, then to character array, then array (why the extra to_a)
  array = blob.to_s.chars.to_a
  # if an odd number of letters
  if array.length % 2 == 1
    # delete the middle character
    array.delete_at((array.length - 1 )/ 2)
  end
  # Extract left half of the string
  left = array.slice(0..(array.length/2 - 1))
  # Extract the right half of the string
  right = array.slice((array.length/2)..-1)
  # Compare left to reverse of right
  if left == right.reverse
    # if same, it is a palindrome
    puts "Found a palindrome!"
  else
    # else, throw palindromeError
    raise PalindromeError, "Not a Palindrome"
  end
end


