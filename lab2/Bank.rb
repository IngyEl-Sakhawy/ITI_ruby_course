class Bank
    def process_transactions(transactions, &block)
        raise NotImplementedError, "Abstract method process_transactions must be implemented in subclass"
    end
end