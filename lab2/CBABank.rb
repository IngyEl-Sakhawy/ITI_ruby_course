require_relative 'Logger'
require_relative 'Transaction'
require_relative 'Bank'
class CBABank < Bank
    include Logger

    def process_transactions(transactions)

        transaction_handler = lambda do |transaction|
            if $out_side_bank_users.include?(transaction.user)
            message = "#{transaction.user.name} is an outside bank user"
            log_error(transaction, message)
            else
            puts "Processing transaction: #{transaction}"
            puts "#{transaction.user.name} and #{transaction.value}"
            perform_transaction(transaction.user, transaction.value)
            end
        end
        
        transactions.each(&transaction_handler)
    end

    def perform_transaction(user, value)
        transaction = Transaction.new(user, value)
        if value > 0 && value <= user.balance
            log_info(transaction)
            user.balance-=value
        elsif user.balance == 0
            log_warning(user)
        elsif value > user.balance
            message = 'Not enough balance'
            log_error(transaction, message)
        end
    end
end