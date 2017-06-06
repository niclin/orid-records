class Item < ApplicationRecord
  has_many :buy_records

  def buy(user)
    return false if user.exp < point

    unless user.has_item?(self)
      transaction do
        buy_records.build(user: user, start_date: Time.zone.now, end_date: Time.zone.now + 3.days).save
      end
    end
  end
end
