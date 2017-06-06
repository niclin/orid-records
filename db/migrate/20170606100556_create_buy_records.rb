class CreateBuyRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_records do |t|
      t.integer :user_id
      t.integer :item_id
      t.date :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
