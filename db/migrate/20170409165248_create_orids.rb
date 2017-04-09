class CreateOrids < ActiveRecord::Migration[5.0]
  def change
    create_table :orids do |t|
      t.integer :user_id
      t.text :objective
      t.text :reflective
      t.text :interpretive
      t.text :decisional

      t.timestamps
    end
  end
end
