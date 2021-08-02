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
    print "date || credit || debit || balance"
  end

  private

  def get_date
    Time.new.strftime("%d/%m/%y")
  end

end
