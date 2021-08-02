require 'bank_account'

describe BankAccount do

  describe '#initialize' do
    it 'initializes with a bank balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the balance when money is deposited' do
      subject.deposit(500)
      expect(subject.balance).to eq 500
    end

    it 'records transaction in the statement array' do
      subject.deposit(500)
      expect(subject.statement[0]).to eq [date: Time.new.strftime("%d/%m/%y"), credit: 500, debit: "", balance: 500]
    end
  end

  describe '#withdraw' do
    it 'decreases the balance when money is withdrawn' do
      subject.deposit(500)
      subject.withdraw(300)
      expect(subject.balance).to eq 200
    end

    it 'records transaction in the statement array' do
      subject.deposit(500)
      subject.withdraw(300)
      expect(subject.statement[1]).to eq [date: Time.new.strftime("%d/%m/%y"), credit: "", debit: 300, balance: 200]
    end
  end

  describe '#print_statement' do
    it 'outputs only the header when no money has been withdrawn or deposited' do
      expect {subject.print_statement}.to output("date || credit || debit || balance").to_stdout
    end
  end

end
