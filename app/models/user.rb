class User < ApplicationRecord
  has_many :events

  def to_param
    username
  end
end
