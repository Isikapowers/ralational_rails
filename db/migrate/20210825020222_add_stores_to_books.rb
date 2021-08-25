class AddStoresToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :store, foreign_key: true
  end
end
