require 'rails_helper'

RSpec.describe 'the players index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: true)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: true)
    @steve = @team.players.create!(name: "Steve", number: 91, injured: false)
  end

  describe "Iteration 2" do
    it "has forms to edit a players info" do
      visit "players/#{@kevin.id}/edit"

      expect(page).to have_field("Name")
      expect(page).to have_field("Number")
      expect(page).to have_field("Injured")
    end

    it "updates a players info by editing" do
      visit "players/#{@kevin.id}/edit"

      fill_in('Name', with: 'Kevin')
      fill_in('Number', with: '24')
      check('injured')

      click_on "Submit"

      expect(current_path).to eq("/players/#{@kevin.id}")
      expect(page).to have_content("Kevin")
      expect(page).to have_content("24")
    end
  end
end
