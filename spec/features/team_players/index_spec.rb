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

  describe "iteration 1" do
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

    it 'shows each teams players attributes' do
      visit "/teams/#{@team.id}/players"

      expect(page).to have_content(@kevin.name)
      expect(page).to have_content(@kevin.number)
      expect(page).to have_content(@kevin.injured)

      expect(page).to have_content(@lebron.name)
      expect(page).to have_content(@lebron.number)
      expect(page).to have_content(@lebron.injured)
    end

    it 'takes you to a teams players' do
      visit "/teams/#{@team.id}"

      click_on "List of Players"

      expect(current_path).to eq("/teams/#{@team.id}/players")
    end
  end

  describe "iteration 2" do
    it "can take user to teams page from every page" do
      visit "/teams/#{@team.id}/players"

      click_link "Basketball Teams"

      expect(current_path).to eq("/teams")
    end

    it "allows us to create a player from a teams players page" do
      visit "/teams/#{@team.id}/players"

      expect(page).to have_content("Add New Player")
    end

    it "redirects us to create new player when click add new player" do
      visit "/teams/#{@team.id}/players"

      click_on "Add New Player"

      expect(current_path).to eq("/teams/#{@team.id}/players/new")
    end

    it "allows us to fill out the form and submit" do
      visit "/teams/#{@team.id}/players/new"

      fill_in("Name", with: "Michael Jordan")
      fill_in("Number", with: 24)

      click_on "SUBMIT"

      expect(current_path).to eq("/teams/#{@team.id}/players")
      expect(page).to have_content("Michael Jordan")
    end

    it "has a link for alphabetical order" do
      visit "/teams/#{@team.id}/players"

      expect(page).to have_content("View Alphabetical Order")
    end

    it "has a link to edit player" do
      visit "/teams/#{@team.id}/players"

      click_link "EDIT", match: :first

      expect(page).to have_field(:name)
      expect(page).to have_field(:number)
      expect(page).to have_field(:injured)
    end

    xit "allows you to edit a player" do
      visit "/teams/#{@team.id}/players/#{@kevin.id}/edit"

      fill_in("name", with: "KEVIN")
      fill_in("Number", with: 1)

      click_on "SUBMIT"

      expect(current_path).to eq("/teams/#{@team.id}/players/#{@kevin.id}")
      expect(page).to have_content("KEVIN")
    end

    xit "shows players in alphabetical order when clicking link" do
      visit "/teams/#{@team.id}/players"

      click_on "View Alphabetical Order"

      expect(page).to have_content("#{@kevin.name}")
    end
  end

  describe "iteration 3" do
    it "has a search feature" do
      visit "teams/#{@team.id}/players"

      expect(page).to have_content("Search by Number")
    end

    xit "returns all players over the searched number" do
      visit "teams/#{@team.id}/players"

      fill_in('Search', with: "20")
      click_on "Search"
    end
  end
end
