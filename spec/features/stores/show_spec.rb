require "rails_helper"

RSpec.describe "Stores Show Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)
    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)
  end

  it "shows each store by id" do
    visit "/stores/#{@store1.id}"

    expect(page).to have_content(@store1.name)
    expect(page).to_not have_content(@store2.name)

    visit "/stores/#{@store2.id}"

    expect(page).to have_content(@store2.name)
    expect(page).to_not have_content(@store1.name)
  end

  it "shows that store's attributes" do
    visit "/stores/#{@store1.id}"

    expect(page).to have_content(@store1.name)
    expect(page).to have_content(@store1.open_on_weekends)
    expect(page).to have_content(@store1.inventory)

    visit "/stores/#{@store2.id}"

    expect(page).to have_content(@store2.name)
    expect(page).to have_content(@store2.open_on_weekends)
    expect(page).to have_content(@store2.inventory)
  end

  it "can disply a form for user to edit" do
    visit "/stores/#{@store1.id}/edit"

    expect(page).to have_field("name")
    expect(page).to have_field("inventory")
    expect(page).to have_field("open_on_weekends")
  end

  describe "Links/Buttons" do
    it "can go back home" do
      visit "/stores/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end

    it "can take user back to the book index page" do
      visit "/stores"

      click_on "Books"

      expect(current_path).to eq("/books")
    end

    it "can take user to the books of that store page" do
      visit "/stores/#{@store1.id}"

      click_on "List of books"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
    end

    it "can take user to the books of that store page" do
      visit "/stores/#{@store2.id}"

      click_on "List of books"

      expect(current_path).to eq("/stores/#{@store2.id}/books")
    end

    xit "can take user to update/edit store page" do
      visit "/stores/#{@store1.id}"

      click_button "EDIT"

      expect(current_path).to eq("/stores/#{@store1.id}/edit")
    end
  end

end
