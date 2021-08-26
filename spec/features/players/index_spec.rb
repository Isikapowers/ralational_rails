require 'rails_helper'

RSpec.describe 'the players index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: false)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: false)
  end

  it 'can see all players names' do
    visit '/players'

    expect(page).to have_content(@kevin.name)
    expect(page).to have_content(@lebron.name)
    expect(page).to have_content("Number: #{@kevin.number}")
    expect(page).to have_content("Number: #{@lebron.number}")
  end

  it 'links you to a player page' do
    visit '/players'

    click_on "#{@kevin.name}"

    expect(current_path).to eq("/players/#{@kevin.id}")
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Book Index"

    expect(current_path).to eq("/books")
  end

  it 'links you to store index' do
    visit '/players'

    click_on "Store Index"

    expect(current_path).to eq("/stores")
  end

  it 'links you to team index' do
    visit '/players'

    click_on "Team Index"

    expect(current_path).to eq("/teams")
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Players Index"

    expect(current_path).to eq("/players")
  end

  xit 'links you to edit players ' do
    visit '/players'

    click_on "Edit"

    expect(current_path).to eq("/players/#{kevin.id}/edit")
  end
end
