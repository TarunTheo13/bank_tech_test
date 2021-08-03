class BankAccount
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(money)
    @balance += money
    record_transaction(money)
  end

  def withdraw(money)
    @balance -= money
    record_transaction(nil, money)
  end

  def print_statement
    puts "date || credit || debit || balance"
    @statement.reverse_each do |transaction|
      if transaction[:debit] == nil
        puts "#{transaction[:date]} || #{'%.2f' % transaction[:credit]} || || #{'%.2f' % transaction[:balance]}"
      elsif transaction[:credit] == nil
        puts "#{transaction[:date]} || || #{'%.2f' % transaction[:debit]} || #{'%.2f' % transaction[:balance]}"
      end
    end
  end

  private

  def get_date
    Time.new.strftime("%d/%m/%y")
  end

  def record_transaction(credit = nil, debit = nil)
    @statement << {date: get_date, credit: credit, debit: debit, balance: @balance}
  end

end
