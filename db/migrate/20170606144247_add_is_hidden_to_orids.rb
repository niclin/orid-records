class AddIsHiddenToOrids < ActiveRecord::Migration[5.0]
  def change
    add_column :orids, :is_hidden, :boolean, default: false
  end
end
