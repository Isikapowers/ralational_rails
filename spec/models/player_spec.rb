require 'rails_helper'

RSpec.describe Player do
  before :each do
    @team1 = Team.create!(name: "NY Knicks", wins: 55, make_playoffs: true)
    @kevin = @team1.players.create!(name: "Kevin Mugele", number: 24, injured: true)
    @steve = @team1.players.create!(name: "Steve", number: 1, injured: false)

    @team2 = Team.create!(name: "Nuggets", wins: 45, make_playoffs: false)
    @mike = @team2.players.create!(name: "Mike", number: 99, injured: true)
    @james = @team2.players.create!(name: "James", number: 67, injured: false)
  end

    it {should belong_to :team}

    it "can count players on the team" do
      expect(@team1.players.count).to eq(2)
    end

    it "can show only true value" do
      expect(@team1.players.show_only_true).to eq([@kevin])
      expect(@team2.players.show_only_true).to eq([@mike])
    end

    it "can order players in alphabetical order" do
      expect(@team1.players.alphabetical_order).to eq([@kevin, @steve])
      expect(@team2.players.alphabetical_order).to eq([@james, @mike])
    end

    it "can search players by number" do
      expect(Player.search(50)).to eq([@mike, @james])
    end
end
