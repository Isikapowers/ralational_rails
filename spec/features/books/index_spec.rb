require "rails_helper"

RSpec.describe "Book Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)
    @book3 = @store1.books.create!(title: "Rubyist", price: 18.98, kids_friendly: false)
  end

  describe "Features in Iteration 1" do
    it "can create book" do
      expect(@book1).to be_valid
    end

    it "shows all of the books" do
      visit "/books"

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book2.title)
      expect(page).to have_no_content(@book3.title)
    end

    it "shows that book's attributes" do
       visit "/books/#{@book1.id}"

       expect(page).to have_content(@book1.title)
       expect(page).to have_content(@book1.price)
       expect(page).to have_content(@book1.kids_friendly)
    end

    it "shows that book's attributes" do
      visit "/books/#{@book2.id}"

      expect(page).to have_content(@book2.title)
      expect(page).to have_content(@book2.price)
      expect(page).to have_content(@book2.kids_friendly)
    end

    it "can take user back to store index page" do
      visit '/books'

      click_on "Book Stores"

      expect(current_path).to eq("/stores")
    end

    it "can take user to book index page " do
      visit "/stores/#{@store1.id}/books"

      click_link "Books"

      expect(current_path).to eq("/books")
    end
  end

  describe "Features in Iteration 2" do
    it "can take user to edit book page with form" do
      visit "/books"

      click_link "EDIT", match: :first

      expect(current_path).to eq("/books/#{@book1.id}/edit")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "can let user fill out the form and submit" do
      visit "/books/#{@book1.id}/edit"

      fill_in("Title", with: "Hello Kitty")
      fill_in("Price", with: 12.99)
      check("Kids Friendly", with: true)

      click_on "SUBMIT"

      expect(current_path).to eq("/books/#{@book1.id}")
      expect(page).to have_content("Hello Kitty")
      expect(page).to have_content(12.99)
      expect(page).to have_content("true")
    end

    it "can order books in alphabetical order" do
      expect(@store1.books.alphabetical_order).to eq([@book1, @book2, @book3])
    end

    it "can show only kids friendly books" do
      expect(@store1.books.show_only_true).to eq([@book1, @book2])
    end

    it "can search books by price" do
      expect(@store1.books.search(20)).to eq([@book2])
    end
  end

  describe "Iteration 3" do
    it "can allow user to delete book" do
      visit "/books"

      click_on "DELETE", match: :first

      expect(current_path).to eq("/books")
      expect(page).to have_no_content(@book1)
      expect(page).to have_content(@book2.title)
    end
  end

  describe "Go Back Home Link" do
    it "can go back home" do
      visit "/books/"

      click_link "Go Back Home"

      expect(current_path).to eq("/")
    end
  end

end
