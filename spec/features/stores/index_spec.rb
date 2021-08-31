require "rails_helper"

RSpec.describe "Stores Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739, created_at: "2021-08-30")
    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638, created_at: "2021-08-31")

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)
    @book3 = @store1.books.create!(title: "Rubyist", price: 18.98, kids_friendly: false)
  end

  describe "Features in teration 1" do
    it "shows the name of each store record in the system" do
      visit "/stores"

      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store2.name)
    end

    it "shows each store by id" do
      visit "/stores/#{@store1.id}"

      expect(page).to have_content(@store1.name)
      expect(page).to have_no_content(@store2.name)

      visit "/stores/#{@store2.id}"

      expect(page).to have_content(@store2.name)
      expect(page).to have_no_content(@store1.name)
    end

    it "can show user the most recently created store first and when it was created" do
      visit "/stores"

      expect(@store2.name).to appear_before(@store1.name)
    end

    it "can take user to stores page from every page" do
      visit "/stores/#{@store1.id}/books"

      click_link "Book Stores"

      expect(current_path).to eq("/stores")
    end
  end

  describe "Features in iteration 2" do
    it "can display a link to take to #new" do
      visit "/stores"

      click_on "Add New Store"

      expect(current_path).to eq("/stores/new")
    end

    it "can display a form for user to fill out" do
      visit "/stores/new"

      expect(page).to have_field(:name)
      expect(page).to have_field(:inventory)
      expect(page).to have_field(:open_on_weekends)
    end

    it "allows user to submit a new store after filling out" do
      visit "/stores/new"

      fill_in(:name, with: "Books and Friends")
      fill_in(:inventory, with: 3725)
      check(:open_on_weekends, with: true)

      click_on "SUBMIT", match: :first

      expect(current_path).to eq("/stores")
      expect(page).to have_content("Books and Friends")
      # expect(page).to have_content(3725)
      # expect(page).to have_content("true")
    end

    it "can take user to a specific store" do
      visit "/stores"

      click_on @store1.name, match: :first

      expect(current_path).to eq("/stores/#{@store1.id}")
      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store1.open_on_weekends)
      expect(page).to have_content(@store1.inventory)

      expect(page).to have_no_content(@store2.name)
      expect(page).to have_no_content(@store2.open_on_weekends)
      expect(page).to have_no_content(@store2.inventory)
    end

    it "can take user to a specifc store's edit page" do
      visit "/stores"

      click_on "EDIT", match: :first

      expect(current_path).to eq("/stores/#{@store1.id + 1}/edit")
    end

    it "can take user to edit page with form" do
      visit "/stores/#{@store1.id}/edit"

      expect(page).to have_field("name")
      expect(page).to have_field("inventory")
      # expect(page).to have_check("kids friendly")
    end

    it "can let user fill out the form and submit" do
      visit "/stores/#{@store1.id}/edit"

      fill_in("Name", with: "Hello Book Lovers")
      fill_in("Inventory", with: 8888)
      check(:open_on_weekends, with: true)

      click_on "SUBMIT"

      expect(current_path).to eq("/stores/#{@store1.id}")
      expect(page).to have_content("Hello Book Lovers")
      # expect(page).to have_content("8888")
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
    it "can allow user to delete a store" do
      visit "/stores"

      click_button "DELETE", match: :first

      expect(current_path).to eq("/stores")
      expect(page).to have_no_content(@store1)
      expect(page).to have_content(@store1.name)
    end
  end

  describe "Go back home link" do
    it "can go back home from the page" do
      visit "/stores"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end
end
