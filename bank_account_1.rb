class BankAccount
  attr_accessor :acct_number, :checking_acct, :saving_acct
  @no_of_accounts = 0

  class << self
    attr_accessor :no_of_accounts
  end 

  def initialize
  	create_new_account
  	@checking_acct = 5000 
  	@saving_acct = 5000
  	@interest_rate = 0.125
  	self.class.no_of_accounts += 1
  end

  def display_account_number
  	puts @acct_number
  end

  def checking_account_balance
  	puts "Your checking account balance is #{@checking_acct}"
  end

  def saving_account_balance
    puts "Your saving account balance is #{@saving_acct}"
  end

  def deposit_to_checking(amount)
  	puts "depositing to checking account"
    @checking_acct += amount
  end

  def deposit_to_saving(amount)
  	puts "depositing to saving account"
  	@saving_acct += amount
  end

  def withdraw_from_checking(amount)
    if amount > @checking_acct
      puts "Insufficient funds"
    else
      @checking_acct -= amount
      puts "You have #{@checking_acct} left in your checking balance"
    end 
  end

  def withdraw_from_saving(amount)
  	if amount > @saving_acct
      puts "Insufficient funds"
    else
      @saving_acct -= amount
      puts "You have #{@saving_acct} left in your checking balance"
    end 
  end

  def total_money
  	puts "Your Checking Account balance is: #{@checking_acct + (@checking_acct * @interest_rate)}"
	puts "Your Savings Account balance is: #{@saving_acct + (@saving_acct * @interest_rate)}"
	puts "Total balance is: #{(@checking_acct + @saving_acct) + ((@checking_acct+@saving_acct)) * @interest_rate}"
  end

  def account_information
    puts "Your account number is: #{@acct_number}"
	puts "Total balance is: #{(@checking_acct + @saving_acct) + ((@checking_acct+@saving_acct)) * @interest_rate}"
	puts "Your Checking Account balance is: #{@checking_acct + (@checking_acct * @interest_rate)}"
	puts "Your Savings Account balance is: #{@saving_acct + (@saving_acct * @interest_rate)}"
	puts "The interest rate is: #{@interest_rate}"
  end 

  def count_accounts
	puts "There are a total of #{self.class.no_of_accounts} account(s)"
  end

  private
	attr_accessor :interest_rate

	def create_new_account
		@acct_number = rand.to_s[2..9]
	end

end

justin = BankAccount.new
justin.display_account_number
justin.count_accounts
