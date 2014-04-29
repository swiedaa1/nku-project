class AddPrices < ActiveRecord::Migration
  def change
    add_column :items, :price, :integer
  end
end
