class StringsForItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :category, :string
  end
end
