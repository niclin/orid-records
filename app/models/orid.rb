class Orid < ApplicationRecord
  belongs_to :user

  validates :objective, :reflective, :interpretive, :decisional,  presence: true

  default_scope { order("created_at DESC") }

  def editable_by?(user)
    self.user == user
  end
end
