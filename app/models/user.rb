class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orids
  has_many :comments
  has_many :orders
  has_many :experience
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :buy_records

  validates_presence_of :name

  mount_uploader :avatar, AvatarUploader

  def admin?
    is_admin
  end

  def promote
    update_columns(is_paid: true)
  end

  def deomote
    update_columns(is_paid: false)
  end

  def can_use?
    return true if is_paid == true || orids.size <= 7
  end

  def exp
    experience.where(user_id: id).sum(:point) - buy_records.sum(:point)
  end

  def has_item?(item)
    buy_records.where(item: item).exists?
  end

  def has_event?(event)
    Item.where(id: buy_records.pluck(:item_id), event: event).exists?
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  is_admin               :boolean          default(FALSE)
#  is_paid                :boolean
#
