require 'rails_helper'

RSpec.describe Store, type: :model do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739, created_at: "2021-08-20")

    @dino = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @moon = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)

    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638, created_at: "2021-08-26")

    @harry = @store2.books.create!(title: "Harry Potter", price: 19.99, kids_friendly: true)
    @rr= @store2.books.create!(title: "Ruby on Rails", price: 39.77, kids_friendly: false)
  end

  it {should have_many :books}

  xit "can order stores in recent created at order" do
    expect(order("created_at DESC")).to eq([@store1, @store2])
  end

  it "can crate a book" do
    expect(@store1.books.new).to be_valid
  end

  it "can count books in the store" do
    expect(@store1.books.count).to eq(2)
  end

  it "can show only true value" do
    expect(@store1.books.show_only_true).to eq([@dino, @moon])
    expect(@store2.books.show_only_true).to eq([@harry])
  end

  it "can order books in alphabetical order" do
    expect(@store1.books.alphabetical_order).to eq([@dino, @moon])
    expect(@store2.books.alphabetical_order).to eq([@harry, @rr])
  end

end
