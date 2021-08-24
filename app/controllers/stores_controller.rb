class StoresController < ApplicationController
  def index
    @stores = ["store1", "store2", "store3"]
  end

  def new

  end

  def create
    store = Store.new({
      name: params[:store][:name],
      inventory: params[:store][:inventory],
      open_on_weekends: params[:store][:open_on_weekends]
      })

    store.save

    redirect_to "/stores"  
  end

end
