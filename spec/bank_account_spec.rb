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
  end

  describe '#withdraw' do
    it 'decreases the balance when money is withdrawn' do
      subject.deposit(500)
      subject.withdraw(300)
      expect(subject.balance).to eq 200
    end
  end

end
