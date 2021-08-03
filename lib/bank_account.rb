class BankAccount
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(money)
    @balance += money
    @statement << [date: get_date, credit: money, debit: "", balance: @balance]
  end

  def withdraw(money)
    @balance -= money
    @statement << [date: get_date, credit: "", debit: money, balance: @balance]
  end

  def print_statement
    puts "date || credit || debit || balance"
    @statement.each do |transaction|
      puts "#{transaction[0][:date]} || #{'%.2f' % transaction[0][:credit]} || || #{'%.2f' % transaction[0][:balance]}"
    end
  end

  private

  def get_date
    Time.new.strftime("%d/%m/%y")
  end

end
