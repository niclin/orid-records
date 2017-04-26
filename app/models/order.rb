# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  total      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#  is_paid    :boolean          default(FALSE)
#  aasm_state :string           default("pending")
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def build_item
    item = items.build
    item.membership_name = "Premium"
    item.quantity = 1
    item.price = 500
    item.save
  end

  def calculate_total!
    self.total = 500
    self.save
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  include AASM

  aasm do
    state :pending, initial: true
    state :paid, :refunded

    event :paid do
      transitions from: :pending, to: :paid
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end
end
