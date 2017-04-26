# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  orid_id    :integer
#  point      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Experience < ApplicationRecord
end
