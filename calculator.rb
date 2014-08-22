  # 1. String interpolation vs contat
  # 2. Extract repetitive logic to method
  # 3. Keep track of variable types (class)
  # 4. Variable scope determined by do...end
  # 5. Outer scope vars are available to inner scope, but not to vice versa
  # 6. Pass by ref vs pass by value, if outer obj was modified
  
  puts "What's the first number?"
  num1 = gets.chomp

  puts "What's the second number?"
  num2 = gets.chomp

  puts "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp
if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
 result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
elsif operator == '4'
  result = num1.to_f / num2.to_f
end
puts "Result is #{result}"
