require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before(:each) do
    @library_1 = Library.new("Denver Public Library")
    @author_1 = Author.new({first_name: "John", last_name: "Man"})
    @author_2 = Author.new({first_name: "Lindsay", last_name: "Lady"})
    @book_1 = @author_1.write("Fancy Book", "January 23 1945")
    @book_2 = @author_1.write("Sinister Book", "1922")
    @book_3 = @author_2.write("Happy Book", "April 23 1985")
    @book_4 = @author_2.write("Scary Book", "August 18 1992")
    @book_5 = @author_2.write("Thoughtful Book", "January 24, 1999")
  end

  it "exists" do
    expect(@library_1).to be_a(Library)
    expect(@library_1.name).to eq("Denver Public Library")
  end

  it "has attributes" do
    expect(@library_1.books).to be_a(Array)
    expect(@library_1.authors).to be_a(Array)
  end

  it "can add authors" do
    @library_1.add_author(@author_1)
    @library_1.add_author(@author_2)

    expect(@library_1.authors.length).to eq(2)
    expect(@library_1.authors[0]).to be_a(Author)
    expect(@library_1.books.length).to eq(5)
    expect(@library_1.books[0]).to be_a(Book)
  end

  it "can report author's time frame" do
    expect(@library_1.publication_time_frame_for(@author_1)).to eq({:start=>"1922", :end=>"1945"})
    expect(@library_1.publication_time_frame_for(@author_2)).to eq({:start=>"1985", :end=>"1999"})
  end

  describe "checking out" do
    before(:each) do
      @library_1 = Library.new("Denver Public Library")
      @author_1 = Author.new({first_name: "John", last_name: "Man"})
      @author_2 = Author.new({first_name: "Lindsay", last_name: "Lady"})
      @book_1 = @author_1.write("Fancy Book", "January 23 1945")
      @book_2 = @author_1.write("Sinister Book", "1922")
      @book_3 = @author_2.write("Happy Book", "April 23 1985")
      @book_4 = @author_2.write("Scary Book", "August 18 1992")
      @book_5 = @author_2.write("Thoughtful Book", "January 24, 1999")
    end

    it "can check out books" do
      expect(@library_1.checked_out_books.length).to eq(0)
      expect(@library_1.available?(@book_1)).to eq(true)
      
      @library_1.check_out(@book_1)
      
      expect(@book_1.checked_out).to eq(true)
      expect(@library_1.checked_out_books.length).to eq(1)
      expect(@library_1.checked_out_books[0]).to eq(@book_1)
      expect(@library_1.available?(@book_1)).to eq(false)
    end

    it "can return books" do
      @library_1.check_out(@book_1)

      @library_1.return(@book_1)

      expect(@book_1.checked_out).to eq(false)
      expect(@library_1.checked_out_books.length).to eq(0)
      expect(@library_1.available?(@book_1)).to eq(true)
    end
  end
end