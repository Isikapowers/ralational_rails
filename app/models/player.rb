class Player < ApplicationRecord
  belongs_to :team

  def self.show_only_true
    where(injured: false)
  end

end
