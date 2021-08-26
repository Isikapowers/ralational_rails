class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  default_scope { order("created_at DESC") }
end
