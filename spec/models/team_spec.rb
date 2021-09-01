require 'rails_helper'

RSpec.describe Team do
  before :each do
    @team1 = Team.create!(name: "NY Knicks", wins: 55, make_playoffs: true)
    @kevin = @team1.players.create!(name: "Kevin Mugele", number: 24, injured: true)
    @steve = @team1.players.create!(name: "Steve", number: 1, injured: false)

    @team2 = Team.create!(name: "Nuggets", wins: 45, make_playoffs: false)
    @mike = @team2.players.create!(name: "Mike", number: 99, injured: true)
    @james = @team2.players.create!(name: "James", number: 67, injured: false)
  end

  it {should have_many :players}

  it "can order teams in recently created order" do
    expect(Team.order("created_at DESC")).to eq([@team2, @team1])
    expect(Team.all.to_sql).to eq(Team.all.order("created_at DESC").to_sql)
  end

  it "can count players in the team" do
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
end
