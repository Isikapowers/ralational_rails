class PlayersController < ApplicationController
  def index
    @players = ["Player 1", "Player 2"]
  end

  def new
  end

  def create
    player = Player.new({
      name: params[:player][:name],
      number: params[:player][:number],
      injured: params[:player][:injured]
    })

    player.save

    redirect_to '/players'
  end
end
