class Orid < ApplicationRecord
  belongs_to :user

  default_scope { order("created_at DESC") }

  def user_email
    user.email
  end
end
