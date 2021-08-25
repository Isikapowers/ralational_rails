class TeamPlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end
end
