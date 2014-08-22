# 1. Create a local variable and modify it at an inner scope. You can try
#     a) re-assigning the variable to something else
#     b) call a method that doesn’t mutate the caller
#     c) call a method that mutates the caller.
#
# 2. Create a local variable at an inner scope and try to reference it in the outer scope. What happens when you have nested do/end blocks?

#  Inner scope can access variables initialized in an outer scope, but not vice versa.

first_name = "Victoria"
first_name = "Jason"
puts first_name
first_name_length = first_name.length
puts first_name_length
first_name.downcase!


# puts last_name 
# => undefined local variable or method `last_name' for main:Object (NameError)

 age = 32

      3.times do 
        new_age = age +=1
        puts new_age
      end
      

# 2. Create a local variable at an inner scope and try to reference it in the outer scope. What happens when you have nested do/end blocks?

# If I understand the second part of 2 you are asking to create a local variable in the innerscope which would be new_age and reference it in the outer scope which would be puts new_age in a do/end block

# Inner scope can access variables initialized in an outer scope, but not vice versa.

