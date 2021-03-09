class Transfer
attr_accessor :status
attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, i)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = i
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
      if self.valid? == true && self.status == "pending" && self.amount < self.sender.balance
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # binding.pry
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
    end
  end

end
