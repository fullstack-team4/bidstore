class AddIdcardToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :idcard, :string
  end
end
