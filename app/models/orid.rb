class Orid < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :experience

  after_create :generate_exp_ponit

  validates :objective, :reflective, :interpretive, :decisional,  presence: true

  default_scope { order("created_at DESC") }


  def editable_by?(user)
    self.user == user
  end

  def generate_exp_ponit
    Experience.create(user_id: user.id, orid_id: id, point: 50)
  end
end
