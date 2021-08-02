require 'bank_account'

describe BankAccount do
  describe '#initialize' do
    it 'initializes with a bank balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
end
