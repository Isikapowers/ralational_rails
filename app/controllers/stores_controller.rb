class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new

  end

  def create
    store = Store.new({
      name: params[:name],
      inventory: params[:inventory],
      open_on_weekends: params[:open_on_weekends]
      })

    store.save

    redirect_to "/stores"
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update({
      name: params[:name],
      inventory: params[:inventory],
      open_on_weekends: params[:open_on_weekends]
      })

    store.save

    redirect_to "/stores/#{store.id}"
  end

  def destroy
    Store.destroy(params[:id])

    redirect_to "/stores"
  end

end
