require 'rails_helper'

RSpec.describe Store do
  it {should have_many :books}

  # it "should display created at from most recent" do
  #   @bookie = Store.create!(name: "Bookie Book", open_on_weekends: true, inventory: 362)
  #   @barnes = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)
  #   @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)
  #
  #   expect().to eq(@bookie)
  # end
end
