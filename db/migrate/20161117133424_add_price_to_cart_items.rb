class AddPriceToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :price, :integer
  end
end
