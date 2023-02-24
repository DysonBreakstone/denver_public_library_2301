require './lib/book.rb'

RSpec.describe Book do

  before(:each) do
    @book_1 = Book.new({author_first_name: "John", author_last_name: "Crowley", title: "Engine Summer", publication_date: "March 12 1979"})
  end
    
  it "exists" do
    expect(@book_1).to be_a(Book)
  end

  it "has attributes" do 
    expect(@book_1.title).to eq("Engine Summer")
    expect(@book_1.author).to eq("John Crowley")
    expect(@book_1.publication_year).to eq("1979")
  end

  it "can accept a puclication date with only a year" do
    book_2 = Book.new({author_first_name: "John", author_last_name: "Crowley", title: "Engine Summer", publication_date: "1979"})
    expect(book_2.publication_year).to eq("1979")
  end

end