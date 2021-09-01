require 'rails_helper'

RSpec.describe 'the players index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: true)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: true)
  end


  it 'allows you to edit player' do
    visit "/players/#{@kevin.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Number")
    expect(page).to have_field("Injured")
  end

  it 'allows you to click on submit player' do
    visit "/players/#{@kevin.id}/edit"

    click_on "Submit"

    expect(current_path).to eq("/players/#{@kevin.id}")
  end
end
