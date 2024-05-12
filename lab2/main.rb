require_relative 'User'
require_relative 'CBABank'
require_relative 'Transaction'

users = [
  User.new("Ali", 200),
  User.new("Peter", 500),
  User.new("Manda", 100)
]

$out_side_bank_users = [
  User.new("Menna", 400),
]

transactions = [
  Transaction.new(users[0], 20),
  Transaction.new(users[0], 30),
  Transaction.new(users[0], 50),
  Transaction.new(users[0], 100),
  Transaction.new(users[0], 100),
  Transaction.new($out_side_bank_users[0], 100)
]


cba_bank = CBABank.new
cba_bank.process_transactions(transactions)

