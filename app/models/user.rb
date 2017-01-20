class User < ApplicationRecord
  has_many :events

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  def to_param
    username
  end
end
