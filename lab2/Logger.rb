module Logger

    def log_info(transaction)

        current_time = Time.now
        File.open("app.log.txt", "a") do |file|
            
            file.puts "#{current_time} -- info -- User #{transaction.user.name} transaction with value #{transaction.value} succeeded."
            
        end
    end

    def log_warning(user)
        current_time = Time.now
        File.open("app.log.txt", "a") do |file|
            
            file.puts "#{current_time} -- warning -- User #{user.name} has 0 balance."
            
        end
    end

    def log_error(transaction, message)
        current_time = Time.now
        File.open("app.log.txt", "a") do |file|
            
            file.puts "#{current_time} -- error -- User #{transaction.user.name} transaction with value #{transaction.value} failed with a message #{message}."
            
        end
    end
end
