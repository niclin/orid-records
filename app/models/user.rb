class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orids
  has_many :comments

  validates_presence_of :name

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
    return false if is_paid == false && orids.size >= 7
  end
end
