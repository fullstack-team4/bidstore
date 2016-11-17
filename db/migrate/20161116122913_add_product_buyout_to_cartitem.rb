class AddProductBuyoutToCartitem < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :product_buyout, :integer
  end
end
