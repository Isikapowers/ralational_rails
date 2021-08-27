class Book < ApplicationRecord
  belongs_to :store

  # default_scope { order("title") }
  def self.alphabetical_order
    order(:title)
  end

  def self.show_only_true
    where(kids_friendly: true)
  end

end
