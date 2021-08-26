class Store < ApplicationRecord
  has_many :books, dependent: :destroy
  #validates :name, presence: true
  default_scope { order("created_at DESC") }

end
