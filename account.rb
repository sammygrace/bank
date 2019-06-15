#name
puts "Name:"
@name = gets.chomp
puts "Welcome, #{@name}!"
@file = "data/#{@name}.balance"

#sets balance to already saved balance
@balance = File.exist?(@file) ? IO.read(@file).to_i : 0
puts "Your balance is $#{@balance}."

#give instructions
puts "~ enter positive numbers to add money to your balance."
puts "~ enter negative numbers to take away money from your balance."
@value = gets.chomp.to_i

#deposit/withdraw money until all done
until @value == 0
  @balance = @balance + @value
  puts "Your new balance is #{@balance}."
  @value = gets.chomp.to_i
end

#goodbye message
puts "="*50
puts "Thank you for banking with us, #{@name}."
puts "See you soon!"
puts "="*50
IO.write @file, @balance
