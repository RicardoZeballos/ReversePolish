# #!/usr/bin/env ruby
# Ricardo Zeballos 9/17/2013

print "Welcome to the Reverse Calculator\n"
stack = []
operators = ["+","-","*","/"]

class String
  def is_numeric?
    begin Float(self) ; true end rescue false
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
    exp = "#{input} #{stack.pop}"
    exp = "#{stack.pop} #{exp}"
    result = instance_eval(exp)
    stack.push(result)
  else
    puts "Error: Not enough numbers left or not valid input."
  end
  puts stack.last
end
