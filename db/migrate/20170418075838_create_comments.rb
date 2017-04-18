class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :orid_id
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
