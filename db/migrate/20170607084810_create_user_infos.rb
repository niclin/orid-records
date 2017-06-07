class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.text :key
      t.text :secret
      t.string :api_type

      t.timestamps
    end
  end
end
