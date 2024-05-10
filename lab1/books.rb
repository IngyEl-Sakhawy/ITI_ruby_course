require 'json'
class Book
    attr_accessor :tilte
    attr_accessor :auther
    attr_accessor :isbn 
    def initialize(tilte, auther, isbn)
        @tilte = tilte
        @auther = auther
        @isbn = isbn
        filename = 'E:\iti\Ruby\lab1\books.json'
        hash = { title: tilte, author: auther, isbn: isbn }

        if File.exist?(filename) && !File.zero?(filename)
            array = JSON.parse(File.read(filename))
        else
            array = []
        end
        array << hash

      File.open(filename, 'w') do |f|
        f.write(JSON.pretty_generate(array))
      end
    end
  
    def introduce
      puts "This name is #{@tilte} by the Auther #{@auther}."
    end
  
    private
  
    def private_method
      "This is a private method"
    end
  
    protected
  
    def protected_method
      "This is a protected method"
    end
end
  