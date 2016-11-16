class AddBuyoutPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :buyout, :integer
  end
end
