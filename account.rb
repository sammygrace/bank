puts "Name:"
@name = gets.chomp
puts "Welcome, #{@name}!"

@balance = 0 
puts "Your balance is $#{@balance}."

puts "~ enter positive numbers to add money to your balance."
puts "~ enter negative numbers to take away money from your balance."
@value = gets.chomp.to_i

until @value == 0
  @balance = @balance + @value
  puts "Your new balance is #{@balance}."
  @value = gets.chomp.to_i
end

puts "="*50
puts "Thank you for banking with us, #{@name}."
puts "See you soon!"
puts "="*50
IO.write("data/#{@name}.balance", @balance)
