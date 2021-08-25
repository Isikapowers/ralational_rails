class Team < ApplicationRecord
  has_many :players

  default_scope { order("created_at DESC") }
end
