require 'rails_helper'

RSpec.describe 'the players index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: true)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: true)
    @steve = @team.players.create!(name: "Steve", number: 91, injured: false)
  end

  describe "Iteration 1" do
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

    it "shows all a players attributes" do
      visit "/players/#{@kevin.id}"

      expect(page).to have_content(@kevin.name)
      expect(page).to have_content(@kevin.number)
    end

    it 'allows you to see a specific player and their attributes' do
      visit "/players/#{@kevin.id}"

      expect(page).to have_content("Kevin Durant")
      expect(page).to have_content("Number: 25")
      expect(page).to have_no_content("Are they injured?: false")
    end
  end

  describe "iteration 2" do
    it 'links you to edit players ' do
      visit '/players'

      click_on "EDIT", match: :first

      expect(current_path).to eq("/players/#{@kevin.id}/edit")
    end

    it "allows you to edit a player" do
      visit "/players/#{@kevin.id}/edit"

      fill_in('Name', with: 'Kev')
      fill_in('Number', with: '11')
      check('injured')

      click_on "Submit"

      visit "/players/#{@kevin.id}"

      expect(page).to have_content("Kev")
      expect(page).to have_content("11")
    end

    it "only shows true records" do
      visit "/players"

      expect(page).to have_no_content("#{@steve.name}")
      expect(page).to have_content("#{@kevin.name}")
      expect(page).to have_content("#{@lebron.name}")
    end

    it "has a button for editing player" do
      visit "/players"

      expect(page).to have_content("EDIT")

      click_on "EDIT", match: :first

      expect(current_path).to eq("/players/#{@kevin.id}/edit")
    end
  end

  describe "iteration 3" do
    it "has a delete button" do
      visit "/players"

      expect(page).to have_content("DELETE")
    end

    it "deletes a team when clicking delete" do
      visit "/players"

      expect(page).to have_content("#{@kevin.name}")
      expect(page).to have_content("#{@lebron.name}")

      click_on "DELETE", match: :first

      expect(page).to have_no_content("#{@kevin.name}")
      expect(page).to have_content("#{@lebron.name}")
    end
  end
end
