class Library
 
  attr_reader :books, :authors, :name, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    books.flatten!
  end

  def publication_time_frame_for(author)
    dates = []
    author.books.each {|book| dates << book.publication_year}
    return {start: dates.sort.first, end: dates.sort.last}
  end

  def check_out(book)
    book.checked_out = true
    checked_out_books << book
  end

  def available?(book)
    !checked_out_books.include?(book)
  end

  def return(book)
    book.checked_out = false
    checked_out_books.delete(book)
  end
end
