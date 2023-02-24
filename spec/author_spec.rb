require './lib/book'
require './lib/author'

RSpec.describe Author do
  
  describe "instantiation" do
    before(:each) do 
      @author_1 = Author.new({first_name: "John", last_name: "Man"})
      @author_2 = Author.new({first_name: "Lindsay", last_name: "Lady"})
    end
    
    it "exists" do
      expect(@author_1).to be_a(Author)
      expect(@author_2).to be_a(Author)
    end

    it "has a name" do
      expect(@author_1.name).to eq("John Man")
      expect(@author_2.name).to eq("Lindsay Lady")
    end

    it "has an empty book array at instantiation" do
      expect(@author_1.books).to be_a(Array)
      expect(@author_1.books.length).to eq(0)
    end
  end

  describe "write" do
    before(:each) do 
      @author_1 = Author.new({first_name: "John", last_name: "Man"})
      @author_2 = Author.new({first_name: "Lindsay", last_name: "Lady"})
    end

    it "can write books" do
      book_1 = @author_1.write("Fancy Book", "January 23 1945")
      
      expect(book_1).to be_a(Book)
      expect(book_1.title).to eq("Fancy Book")

      book_2 = @author_1.write("Sinister Book", "1922")
     
      expect(@author_1.books.length).to eq(2) 
      expect(@author_1.books[0]).to be_a(Book)
    end
  end
end