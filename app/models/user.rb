# frozen_string_literal: true
class User < ApplicationRecord
  has_many :events
  has_many :participations
  has_many :applied_events, through: :participations, source: :event

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  def to_param
    username
  end
end
