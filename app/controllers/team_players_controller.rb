class TeamPlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
    if params[:order] == "name"
      @players = @players.alphabetical_order
    elsif params[:search]
      @players = @players.search(params[:search])
    end
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    team = Team.find(params[:team_id])
    player = team.players.create({
      name: params[:name],
      number: params[:number],
      injured: params[:injured]
    })

    redirect_to "/teams/#{team.id}/players"
  end

  def show
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:player_id])

    redirect_to "/teams/#{@team.id}/players"
  end

  def edit
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:player_id])
  end

  def update
    team = Team.find(params[:team_id])
    player = team.players.find(params[:player_id])
    player.update({
      name: params[:name],
      number: params[:number],
      injured: params[:injured]
    })

    player.save

    redirect_to "/teams/#{team.id}/players/#{player.id}"
  end

  def destroy
    team = Team.find(params[:team_id])
    player.destroy(params[:player_id])

    redirect_to "/teams/#{team.id}/players"
  end

end
