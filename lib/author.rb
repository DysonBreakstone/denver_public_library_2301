class Author

  attr_reader :name, :books

  def initialize(name_hash)
    @first_name = name_hash[:first_name]
    @last_name = name_hash[:last_name]
    @name = @first_name + " " + @last_name
    @books = []
  end

  def write(title, pub_date)
    this_book = Book.new(({author_first_name: @first_name,
                          author_last_name: @last_name,
                          title: title,
                          publication_date: pub_date}))
    @books << this_book                        
    return this_book
  end
end
