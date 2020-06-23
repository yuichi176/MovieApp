class AddAddDate < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :add_date, :string
  end
end
