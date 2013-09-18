# #!/usr/bin/env ruby
# Ricardo Zeballos 9/18/2013

print "Welcome to the Reverse Calculator\n"
stack = []
operators = ["+","-","*","/"]

class String
  def is_numeric?
    begin Float(self) ; true end rescue false
  end
end

#Done without eval
def evaluateMath(num1, num2, op)
  if(op == "+")
    return num1 + num2
  elsif(op == "-")
    return num1 - num2
  elsif(op == "*")
    return num1 * num2
  else
    return num1 / num2
  end
end

while(true)
  print ">"
  input = gets.chomp
  if(input == "q")
    puts "Goodbye"  
    break
  elsif(input.is_numeric?)
    stack.push(input.to_f)
  elsif(operators.include?(input) && (stack.size >= 2))
    num2 = stack.pop
    num1 = stack.pop
    result = evaluateMath(num1, num2, input)
    stack.push(result)
  else
    puts "Error: Not enough numbers left or not valid input."  
  end
  puts stack.last 
end
