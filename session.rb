class Session
  def initialize 
    welcome
    fetch_account
    instructions
    transactions
    update_account
    goodbye
  end
  
  def welcome
    puts "Name:"
    @name = gets.chomp
    puts "Welcome, #{@name}!"
  end

  def fetch_account
    @file = "data/#{@name}.balance"
    @balance = File.exists?(@file) ? IO.read(@file).to_i : 0
    puts "You have $#{@balance} in your account."
  end

  def change_value
    @value = gets.chomp.to_i
  end

  private
  def instructions
    puts "~ enter a positive number to deposit money."
    puts "~ enter a negative number to withdraw money."
    change_value
  end

  def transactions
    until @value == 0
      change_balance
    end
  end

  def change_balance
    @balance = @balance + @value
    puts "You now have $#{@balance} in your account."
    change_value
  end

  def update_account
    IO.write @file, @balance
  end

  def goodbye
    puts "="*50
    puts "Goodbye, #{@name}."
    puts "Session ended."
    puts "="*50
  end
end

Session.new
