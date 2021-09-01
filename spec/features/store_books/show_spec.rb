require "rails_helper"

RSpec.describe "Store Book Show Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)

    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)
  end

  it "shows all books for the store" do
    visit "/stores/#{@store1.id}/books"

    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book2.title)

    expect(@store1.books.size).to eq(2)
  end

  it "shows all books for the store" do
    visit "/stores/#{@store2.id}/books"

    expect(page).to have_no_content(@book1.title)
    expect(page).to have_no_content(@book2.title)

    expect(@store2.books.size).to eq(0)
  end

  describe "Links/Buttons" do
    it "can go back home" do
      visit "/books/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end

    it "can take user to all books of the store page from any page" do
      visit "/stores/#{@store1.id}"

      click_link "List of Books"

      expect(current_path).to eq("/stores/#{@store1.id}/books")

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book1.price)
      expect(page).to have_content(@book1.kids_friendly)
      expect(page).to have_content(@book2.title)
      expect(page).to have_content(@book2.price)
      expect(page).to have_content(@book2.kids_friendly)
    end

    it "can take user to add new book page" do
      visit "/stores/#{@store1.id}"

      click_link "Add New Book"

      expect(current_path).to eq("/stores/#{@store1.id}/books/new")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "can take user back to all stores page" do
      visit "/stores/#{@store1.id}"

      click_link "List of Stores"

      expect(current_path).to eq("/stores")

      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store2.name)
    end
  end
end
