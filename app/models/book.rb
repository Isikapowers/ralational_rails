class Book < ApplicationRecord
  belongs_to :store
  #validates :kids_friendly: true
end
