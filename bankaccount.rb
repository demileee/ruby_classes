class BankAccount

  @@interest_rate = 1.01
  @@accounts = []
  @@total = 0

  def initialize
    @balance = 0.00
  end

  def balance
    return @balance
  end

  def deposit(amount)
    @balance += amount
    @@total += @balance
  end

  def withdraw(amount)
    @balance -= amount
    @@total -= @balance
  end

  def self.create
    @account = BankAccount.new
    @@accounts << @account
    return @account
  end

  def self.total_funds
    return @@total
  end

  def self.accounts
    return @@accounts
  end

  def self.interest_rate
    return @@interest_rate
  end

  def multiply
    @balance = @balance * @@interest_rate
  end

  def self.interest_time
    @@total = 0
    @@accounts.each do |k|
      @@total += k.multiply
    end
  end

end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts "balance is #{BankAccount.total_funds}" # 1200
puts BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
