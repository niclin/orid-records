class UserInfo < ApplicationRecord
  TYPE = ["poloniex"]

  belongs_to :user
  validates_inclusion_of :api_type, :in => TYPE
end
