class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.create(store_params)

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
    store.update(store_params)

    store.save

    redirect_to "/stores/#{store.id}"
  end

  def destroy
    Store.destroy(params[:id])

    redirect_to "/stores"
  end


  private

  def store_params
    params.require[:store].permit(:name, :inventory, :open_on_weekends, :search_by_price)
  end

end
