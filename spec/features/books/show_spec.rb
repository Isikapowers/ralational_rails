require "rails_helper"

RSpec.describe "Book Show Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)
    @book3 = @store1.books.create!(title: "Rubyist", price: 34.89, kids_friendly: false)
  end

  describe "Features in Iteration 1" do
    it "shows each book by id" do
      visit "/books/#{@book1.id}"

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book1.price)
      expect(page).to have_content(@book1.kids_friendly)

      expect(page).to have_no_content(@book2.title)
      expect(page).to have_no_content(@book2.price)
    end

    it "shows each book by id" do
      visit "/books/#{@book2.id}"

      expect(page).to have_content(@book2.title)
      expect(page).to have_content(@book2.price)
      expect(page).to have_content(@book2.kids_friendly)

      expect(page).to have_no_content(@book1.title)
      expect(page).to have_no_content(@book1.price)
    end

    it "can take user back to the store index page" do
      visit "/books"

      click_on "Book Stores"

      expect(current_path).to eq("/stores")
    end

    it "can take user back to all books page" do
      visit "/books/#{@book1.id}"

      click_on "All Books"

      expect(current_path).to eq("/books")
    end
  end

  describe "Features in Iteration 2" do
    it "takes user to the book edit page and shows a form" do
      visit "/books/#{@book1.id}"

      click_on "EDIT", match: :first

      expect(current_path).to eq("/books/#{@book1.id}/edit")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "allows user to fill in info and submit" do
      visit "/books/#{@book1.id}/edit"

      fill_in(:title, with: "Dinosaurs and Friends")
      fill_in(:price, with: 14.99)
      check(:kids_friendly)

      click_on "SUBMIT"

      expect(current_path).to eq("/books/#{@book1.id}")
    end

    it "shows only the kids friendly books" do
      visit "/books"

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book2.title)
      expect(page).to have_no_content(@book3.title)
    end

    it "can order books in alphabetical order" do
      visit "/books"

      expect(@book1.title).to appear_before(@book2.title)
      expect(current_path).to eq("/books")
    end
  end

  describe "Features in Iteration 3" do
    it "allows user to delete book and redirect back to book page" do
      visit "/books"

      click_on "DELETE", match: :first

      expect(current_path).to eq("/books")
      expect(page).to have_no_content(@book1)
    end
  end

  describe "Go Back Home Link" do
    it "can go back home" do
      visit "/stores/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

end
