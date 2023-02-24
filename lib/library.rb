class Library
 
  attr_reader :books, :authors

  def initialize
    @books = []
    @authors = []
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
end
