require 'rails_helper'

RSpec.describe 'the teams new page' do
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
    it 'has a form for a new team record' do
      visit "/teams/new"

      expect(page).to have_field("Name")
      expect(page).to have_field("Wins")
      expect(page).to have_field("Make playoffs")
    end

    it 'has a form for a new team record' do
      visit "/teams/new"

      click_on "Submit"

      expect(current_path).to eq("/teams")
    end

    it "creates a new team" do
      visit "/teams/new"

      fill_in('Name', with: 'Noobs')
      fill_in('Wins', with: '11')
      check('playoffs')

      click_on "Submit"

      visit "/teams"

      expect(page).to have_content("Noobs")
    end
  end
end
