# Create a method that takes an array as a parameter. Within that method, try calling methods that do not mutate the caller. How does that affect the array outside of the method? What about when you call a method that mutates the caller within the method?

# Calling method that does not mutate the caller

#  Lets say I put alphabetized_names.reverse in the method.  It will not affect the order of the alphabetized names
#  Lets say I put alphabetized_names.reverse! in the method.  It will affect the order of the alphabetized names

names = ["Victoria", "Jason", "Matt", "Lily"]
def alphabetize(names)
  alphabetized_names = []
  names.each do |name|
    alphabetized_names = names.sort
 end
 return alphabetized_names
end

puts "This is the original array"
puts names
puts "\n"
puts "This is the alphabetized_names"
puts alphabetize(names)

