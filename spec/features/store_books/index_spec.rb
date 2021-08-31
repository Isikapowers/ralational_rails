require "rails_helper"

RSpec.describe "Store Book Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @dino = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @moon = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)

    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)

    @harry = @store2.books.create!(title: "Harry Potter", price: 19.99, kids_friendly: true)
    @rr= @store2.books.create!(title: "Ruby on Rails", price: 39.77, kids_friendly: false)
  end

  describe "Features in Iteration 1" do
    it "shows all of the title of the stores" do
      visit "/stores/#{@store1.id}/books"

      expect(page).to have_content(@dino.title)
      expect(page).to have_content(@moon.title)
    end

    it "shows each book's attributes" do
      visit "/stores/#{@store1.id}/books"

      expect(page).to have_content(@dino.title)
      expect(page).to have_content(@dino.price)
      expect(page).to have_content(@dino.kids_friendly)

      expect(page).to have_content(@moon.title)
      expect(page).to have_content(@moon.price)
      expect(page).to have_content(@moon.kids_friendly)

      expect(page).to_not have_content(@harry.title)
      expect(page).to_not have_content(@harry.price)
    end

    it "can take user to the store's books page" do
      visit "/stores/#{@store1.id}"

      click_on "List of Books"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
    end
  end

  describe "Features in Iteration 2" do
    it "can take user to stores page from every page" do
      visit "/stores/#{@store1.id}/books"

      click_link "Book Stores"

      expect(current_path).to eq("/stores")
    end

    it "can take user to add new book to that store with form" do
      visit "/stores/#{@store1.id}"

      click_link "Add New Book"

      expect(current_path).to eq("/stores/#{@store1.id}/books/new")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "allows user fill out the form and submit" do
      visit "/stores/#{@store1.id}/books/new"

      fill_in("Title", with: "Hello Kitty")
      fill_in("Price", with: 12.99)
      # check("Kids friendly", with: true)

      click_on "SUBMIT"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
      expect(page).to have_content("Hello Kitty")
      # expect(page).to have_content("8888")
      # expect(page).to have_content("Open_on_weekends: true")
    end

    it "can take user to edit existing book with form" do
      visit "/stores/#{@store1.id}/books"

      click_link "EDIT", match: :first

      expect(current_path).to eq("/stores/#{@store1.id}/books/#{@dino.id}/edit")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "can let user fill out the form and submit" do
      visit "/stores/#{@store1.id}/books/#{@dino.id}/edit"

      fill_in("Title", with: "Hello Kitty")
      fill_in("Price", with: 12.99)
      # check("Kids friendly", with: true)

      click_on "SUBMIT"

      expect(current_path).to eq("/stores/#{@store1.id}/books/#{@dino.id}")
      expect(page).to have_content("Hello Kitty")
      # expect(page).to have_content("8888")
      # expect(page).to have_content("Open_on_weekends: true")
    end

    it "can disply books in alphabetical order" do
      visit "/stores/#{@store1.id}/books"

      click_on "View Alphabetical Order"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
      expect(@dino.title).to appear_before(@moon.title)
    end
  end

  describe "Features in Iteration 3" do
    it "allows user to delete book" do
      visit "/stores/#{@store1.id}/books"

      click_on "DELETE", match: :first

      expect(current_path).to eq("/stores/#{@store1.id}/books")
      expect(page).to have_no_content(@dino)
      expect(page).to have_text(@moon.title)
    end

    it "can search books by price" do
      visit "/stores/#{@store1.id}/books"

      fill_in(:search, with: 29)
      click_on "Search"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
      expect(page).to have_content(@moon.title)
    end
  end

  describe "Go Back Home" do
    it "can go back home" do
      visit "/books/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

end
