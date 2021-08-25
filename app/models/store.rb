class Store < ApplicationRecord
  has_many :books
  #validates :name, presence: true
  default_scope { order("created_at DESC") }

end
