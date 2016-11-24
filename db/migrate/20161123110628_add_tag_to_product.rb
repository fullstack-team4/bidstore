class AddTagToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :tag, :string
  end
end
