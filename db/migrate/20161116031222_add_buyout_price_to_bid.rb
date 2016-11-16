class AddBuyoutPriceToBid < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :buyout, :integer
  end
end
