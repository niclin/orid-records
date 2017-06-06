class AddPointToBuyRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :buy_records, :point, :integer, default: 0
  end
end
