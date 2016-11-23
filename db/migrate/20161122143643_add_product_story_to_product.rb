class AddProductStoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_story, :text
  end
end
