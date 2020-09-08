require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []
  
  def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

      @@all << self

  end

  def valid?
    
    # binding.pry
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end

  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance >= self.amount && self.sender.status == "open" && self.receiver.status == "open"
    self.sender.balance= self.sender.balance - self.amount
    self.receiver.balance=self.receiver.balance + self.amount
    self.status= "complete"

    else
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" 
      self.sender.balance= self.sender.balance + self.amount
      self.receiver.balance=self.receiver.balance - self.amount
      self.status= "reversed"
  
      else
        self.status= "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

end
