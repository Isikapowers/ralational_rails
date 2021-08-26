class Book < ApplicationRecord
  belongs_to :store

  default_scope { order("title") }

  def self.show_only_true
    where(kids_friendly: true)
  end

end
