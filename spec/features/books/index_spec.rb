require "rails_helper"

RSpec.describe "Book Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)
  end

  it "shows all of the title of the stores" do
    visit "/books"

    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book2.title)
  end

  it "shows each book's attributes" do
    visit "/books/#{@book1.id}"

    expect(page).to have_content("Dino Potty Book")
    expect(page).to have_content(13.99)
    expect(page).to have_content("Kids friendly: true")
  end

  it "links you to players" do
    visit '/books'

    click_on "Players"

    expect(current_path).to eq("/players")
  end

  describe "Links/Button" do
    it "can go back home" do
      visit "/books/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

end
