class PlayersController < ApplicationController
  def index
    @players = Player.all
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

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update({
      name: params[:player][:name],
      number: params[:player][:number],
      injured: params[:player][:injured]
      })
    player.save
    redirect_to "/players/#{player.id}"
  end

  def destroy
    Player.destroy(params[:id])
    redirect_to '/players'
  end
end
