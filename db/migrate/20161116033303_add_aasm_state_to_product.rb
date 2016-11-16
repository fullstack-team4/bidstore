class AddAasmStateToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :aasm_state, :string, default: "before_auction"
    add_index  :products, :aasm_state
  end
end
