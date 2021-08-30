require 'rails_helper'

RSpec.describe 'the teams show page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @team_2 = Team.create!(name: "Nets", make_playoffs: true, wins: 25)
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

    click_on "Stores"

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

  describe "iteration 1" do
    it 'shows the count of players for the team' do
      visit "/teams/#{@team.id}"

      expect(page).to have_content("There are 2 players on the team")
    end

    it "takes me to the players of team page" do
      visit "/teams/#{@team.id}"

      expect(page).to have_content("List of Players")

      click_on "List of Players"

      expect(current_path).to eq("/teams/#{@team.id}/players")
    end
  end

  describe "iteration 2" do
    it "allows me to update a team" do
      visit "/teams"

      click_on "EDIT", match: :first

      expect(current_path).to eq("/teams/#{@team_2.id}/edit")
    end
  end
end
