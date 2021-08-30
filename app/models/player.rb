class Player < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates :number, presence: true

  def self.alphabetical_order
    order(:name)
  end

  def self.show_only_true
    where(injured: true)
  end

  def self.search(search)
    if search
      where(["number >= ?", "#{search}"])
    end
  end

end
