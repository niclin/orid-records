class AddStatusToOrids < ActiveRecord::Migration[5.0]
  def change
    add_column :orids, :status, :string, :default => "public"
  end
end
