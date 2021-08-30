require 'rails_helper'

RSpec.describe 'the teams players index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: false)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: false)
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Books"

    expect(current_path).to eq("/books")
  end

  it 'links you to store index' do
    visit '/players'

    click_on "Book Stores"

    expect(current_path).to eq("/stores")
  end

  it 'links you to team index' do
    visit '/players'

    click_on "Teams"

    expect(current_path).to eq("/teams")
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Players"

    expect(current_path).to eq("/players")
  end

  describe "iteration 2" do
    it "creates a new player" do
      visit "/teams/#{@team.id}/players/new"

      expect(page).to have_field("Name")
      expect(page).to have_field("Number")
      expect(page).to have_field("injured")
    end

    it "redirects you back to all players per team after you submit" do
      visit "/teams/#{@team.id}/players/new"

      click_on "SUBMIT"

      expect(current_path).to eq("/teams/#{@team.id}/players")
    end
  end
end
