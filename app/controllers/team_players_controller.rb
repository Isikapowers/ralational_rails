class TeamPlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def new
  end

  def create
    player = Player.new({
      name: params[:player][:name],
      number: params[:player][:number],
      injured: params[:player][:injured],
      team_id: params[:team_id]
    })

    player.save

    redirect_to "/teams/:team_id/players"
  end
end
