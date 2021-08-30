class Book < ApplicationRecord

  belongs_to :store
  validates :title, presence: true
  validates :price, presence: true

  def self.alphabetical_order
    order(:title)
  end

  def self.show_only_true
    where(kids_friendly: true)
  end

  def self.search(search)
    if search
      where(["price >= ?", "#{search}"])
    end
  end

end
