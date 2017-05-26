class Orid < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :experience, dependent: :destroy

  after_create :generate_exp_ponit

  validates :objective, :reflective, :interpretive, :decisional,  presence: true

  default_scope { order("created_at DESC") }

  is_impressionable

  def editable_by?(user)
    self.user == user
  end

  def generate_exp_ponit
    build_experience(user: user, point: 50).save
  end

  def watchers
    commenter_ids = comments.pluck(:user_id).uniq
    commenter_ids << self.user_id
    commenter_ids = commenter_ids.uniq
    User.where(:id => commenter_ids)
  end
end

# == Schema Information
#
# Table name: orids
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  objective    :text
#  reflective   :text
#  interpretive :text
#  decisional   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
