require "rails_helper"

RSpec.describe "Book Show Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)
  end

  it "shows each book by id" do
    visit "/books/#{@book1.id}"

    expect(page).to have_content("Dino Potty Book")
    expect(page).to have_content(13.99)
    expect(page).to have_content("Kids friendly: true")
  end

  it "shows each book by id" do
    visit "/books/#{@book2.id}"

    expect(page).to have_content("I Love You to The Moon and Back")
    expect(page).to have_content(29.89)
    expect(page).to have_content("Kids friendly: true")
  end

  describe "Links/buttons" do
    it "can go back home" do
      visit "/stores/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end

    it "can take user back to the store index page" do
      visit "/books"

      click_on "Book Stores"

      expect(current_path).to eq("/stores")
    end
  end

end