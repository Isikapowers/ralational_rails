require 'rails_helper'

RSpec.describe Store do
  it {should have_many :books}

  # it "should display created at from most recent" do
  #   @store = Store.create!(name: "Bookie Book", open_on_weekends: true, inventory: 362)
  #
  #   expect()
  # end
end
