require 'pry'

class BankAccount
    attr_accessor :status, :balance
    attr_reader :name

    def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    end

    def deposit(i)
        @balance += i
    end

    def display_balance 
        "Your balance is $#{self.balance}."
    end

    def valid?
        status = true
        if self.balance < 1 || self.status == "closed"
            status = false
        end
        status
    end

    def close_account
        self.status = "closed"
    end

end
