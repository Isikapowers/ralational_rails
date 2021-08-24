class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
  end

  def create
    team = Team.new({
      name: params[:team][:name],
      wins: params[:team][:wins],
      make_playoffs: params[:team][:make_playoffs]
      })

    team.save

    redirect_to '/teams'
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update({
      name: params[:team][:name],
      wins: params[:team][:wins],
      make_playoffs: params[:team][:make_playoffs]
      })
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to '/teams'
  end
end
