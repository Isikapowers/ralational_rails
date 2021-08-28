class Store < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates :inventory, presence: true
  # validates :open_on_weekends

  default_scope { order("created_at DESC") }

end
