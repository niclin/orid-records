class Orid < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == owner
  end

  default_scope { order("created_at DESC") }

  def user_email
    owner.email
  end
end
