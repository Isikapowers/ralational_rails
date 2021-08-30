class Book < ApplicationRecord
  belongs_to :store
  validates :title, presence: true
  validates :price, presence: true
  # validates :kids_friendly

  def self.alphabetical_order
    order(:title)
  end

  def self.show_only_true
    where(kids_friendly: true)
  end

  def self.search_by_price(search)
    if search
      self.where("price >= search.to_i")
    end
  end

end
