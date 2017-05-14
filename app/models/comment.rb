class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :orid
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  orid_id    :integer
#  message    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
