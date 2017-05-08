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

class Orid < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :objective, :reflective, :interpretive, :decisional,  presence: true

  default_scope { order("created_at DESC") }


  def editable_by?(user)
    self.user == user
  end
end
