require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before(:each) do
    @library_1 = Library.new
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
  end

  it "has attributes" do
    expect(@library_1.books).to be_a(Array)
    expect(@library_1.authors).to be_a(Array)
  end

  it "can add authors" do
    @library_1.add_author(@author_1)
    @library_1.add_author(@author_2)

    expect(@library_1.authors.length).to eq(2)
    expect(@library_1.books.length).to eq(5)
  end

  it "can report author's time frame" do
    expect(@library_1.publication_time_frame_for(@author_1)).to eq({:start=>"1922", :end=>"1945"})
    expect(@library_1.publication_time_frame_for(@author_2)).to eq({:start=>"1985", :end=>"1945"})
  end
end