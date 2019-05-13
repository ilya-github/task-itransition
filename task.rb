# Task 1.
# Implement the function to find the combination of 4 digits in a row which gives the max multiplication.
# If object is not a string or there are no combinations found - return nil.
# If combination is found - return it's multiplication result.

def max_multiplication(str)
  return nil if !str.kind_of?(String) || !result = str.scan(/[1-9]+{4,}/)
  result.map! do |el|
    el.split('').map(&:to_i).sort.reverse.first(4).inject(&:*)
  end
  result.max
end

# Task 2.
# Implement the function to sort array of numbers by amount of '1' in its binary representation.
# Numbers with identical amount of '1's should be ordered by decimal representation.

def sort(arr)
  number_struct = Struct.new(:count_one, :decimal, :binary)
  arr_number_struct = []
  arr.map do |el|
    binary_representation = el.to_s(2)
    count_one = binary_representation.count('1') 
    arr_number_struct.push(number_struct.new(count_one, el, binary_representation))
  end
  arr_number_struct.sort_by { |p| [p.count_one, p.decimal] }.map(&:binary).join(',')
end

puts max_multiplication('abc12345def')
puts max_multiplication('a1b2c3d4e')

puts sort([3,7,8,9])
