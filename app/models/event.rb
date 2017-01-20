class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :scheduled_at }
  validates :scheduled_at, presence: true
end
