require "rails_helper"

RSpec.describe "Stores Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)
    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)
  end

  it "shows all of the title of the stores" do
    visit "/stores"

    expect(page).to have_content(@store1.name)
    expect(page).to have_content(@store2.name)
  end

  it "shows each store by id" do
    visit "/stores/#{@store1.id}"

    expect(page).to have_content(@store1.name)
    expect(page).to_not have_content(@store2.name)

    visit "/stores/#{@store2.id}"

    expect(page).to have_content(@store2.name)
    expect(page).to_not have_content(@store1.name)
  end

  describe "Links/Buttons in Iteration 1" do
    it "can go back home" do
      visit "/stores"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end

    it "can display a link to take to #new" do
      visit "/stores"

      click_on "Add New Store"

      expect(current_path).to eq("/stores/new")
    end

    xit "can take user to a specific store" do
      visit "/stores"

      click_on @store1.name

      expect(current_path).to eq("/stores/#{@store1.id}")
      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store1.open_on_weekends)
      expect(page).to have_content(@store1.inventory)

      expect(page).to have_no_content(@store2.name)
      expect(page).to have_no_content(@store2.open_on_weekends)
      expect(page).to have_no_content(@store2.inventory)
    end

    xit "can take user to a specifc store's edit page" do
      visit "/stores"

      click_on "EDIT"

      expect(current_path).to eq("/stores/#{@store1.id}/edit")
    end

    it "can take user to edit page with form" do
      visit "/stores/#{@store1.id}/edit"

      expect(page).to have_field("name")
      expect(page).to have_field("inventory")
      # expect(page).to have_check("kids friendly")
    end

    it "can take user to stores page from every page" do
      visit "/stores/#{@store1.id}/books"

      click_link "Book Stores"

      expect(current_path).to eq("/stores")
    end
  end

  describe "Links/Buttons in Iteration 2" do
    it "can take user to add new store page with form" do
      visit "/stores"

      click_link "Add New Store"

      expect(current_path).to eq("/stores/new")

      expect(page).to have_field(:name)
      expect(page).to have_field(:inventory)
      expect(page).to have_field(:open_on_weekends)
    end

    it "can let user fill out the form and submit" do
      visit "/stores/new"

      fill_in("Name", with: "Hello Kitty")
      fill_in("Inventory", with: 8888)
      check("Open on weekends", with: true)

      click_on "SUBMIT"

      expect(current_path).to eq("/stores")
      expect(page).to have_content("Hello Kitty")
      # expect(page).to have_content("8888")
      # expect(page).to have_content("Open_on_weekends: true")
    end

    it "can go back home from any page" do
      visit "/stores/new"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

  describe "Iteration 3" do
    xit "can allow user to delete store" do
      visit "/stores/#{@store1.id}"

      click_button "DELETE"

      expect(current_path).to eq("/stores")
      expect(page).to have_no_content(@store1.name)
      expect(page).to have_content(@store2.name)
    end
  end

end
