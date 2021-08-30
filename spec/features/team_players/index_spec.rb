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

  it 'shows you all the players for a specific team' do
    visit "/teams/#{@team.id}/players"

    expect(page).to have_content("All Players on Team")
    expect(page).to have_content("#{@kevin.name}")
    expect(page).to have_content("#{@kevin.number}")
    expect(page).to have_content("#{@kevin.injured}")
    expect(page).to have_content("#{@lebron.name}")
    expect(page).to have_content("#{@lebron.number}")
    expect(page).to have_content("#{@lebron.injured}")
  end
end
