class AddTimeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :begintime, :datetime
    add_column :products, :endtime, :datetime
  end
end
