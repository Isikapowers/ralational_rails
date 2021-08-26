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

  it "shows all of the title of the stores" do
    visit "/books"

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

  it "links you to books" do
    visit "/stores/#{@store1.id}/books"

    click_on("Players")

    expect(current_path).to eq("/players")
  end

  describe "Links/Buttons" do
    it "can go back home" do
      visit "/books/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

end
