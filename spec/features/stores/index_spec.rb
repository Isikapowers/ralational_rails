require "rails_helper"

RSpec.describe "Stores Index Page" do
    store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)
    store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)

    it "shows all of the title of the stores" do
      visit "/stores"

      expect(page).to have_content(store1.name)
      expect(page).to have_content(store2.name)
    end
  end
