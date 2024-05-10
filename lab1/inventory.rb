require 'json'
require_relative 'books'
class Inventory
    
    def add_book(title, author, isbn)
        # book = Book.new(title, author, isbn)
        # return book
        @title = title
        @auther = author
        @isbn = isbn
        filename = 'E:\iti\Ruby\lab1\books.json'
        hash = { title: title, author: author, isbn: isbn }

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
    
    def remove_book(isbn)
        file = File.open 'E:\iti\Ruby\lab1\books.json'
        data = JSON.load file
        index = data.index { |book| book['isbn'] == isbn }

        if index
        data.delete_at(index)

        File.open(file, 'w') do |file|
            file.write(JSON.pretty_generate(data))
        end
    
        puts "Book with ISBN #{isbn} removed successfully."
        else
        puts "Book with ISBN #{isbn} not found."
        end
    end
    
    def list_books
        file = File.open 'E:\iti\Ruby\lab1\books.json'
        data = JSON.load file
        data.each do |book_document|
            puts "Book name: #{book_document['title']}\n Book auther: #{book_document['author']}"
        end
        end
    
end

inventory = Inventory.new
puts "Menu\n 1.Add book \n 2.List books \n 3.Remove Book"
choice = gets.chomp

case choice 
when "1"
    puts "Enter book Name"
    t_book = gets.chomp
    
    puts "Enter book Author"
    a_book = gets.chomp
    
    puts "Enter book ISBN"
    i_book = gets.chomp
    
    inventory.add_book(t_book, a_book, i_book)
when "2"
    inventory.list_books
when "3"
    puts "Enter book ISBN"
    isbn = gets.chomp
    inventory.remove_book(isbn)
else
    puts "Enter a valid input"
end
