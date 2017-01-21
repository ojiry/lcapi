# frozen_string_literal: true
class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :applied_users, through: :participations, source: :user

  validates :name, presence: true, uniqueness: { scope: :scheduled_at }
  validates :scheduled_at, presence: true

  def as_json(options = nil)
    super(options&.merge(include: :applied_users))
  end
end
