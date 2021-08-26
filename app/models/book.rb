class Book < ApplicationRecord
  belongs_to :store
  #validates :kids_friendly: true
  default_scope { order("title") }
end
