class Event < ApplicationRecord
  belongs_to :user

  scope :between, ->(start, stop) { where('date >= ? AND date <= ?', start, stop) }
  scope :not_repeat,  -> { where(repeat: :no) }
  scope :weekly,  -> { where(repeat: :weekly) }
  scope :monthly,  -> { where(repeat: :monthly) }
  scope :yearly,  -> { where(repeat: :yearly) }

  validates :name, :date, :repeat, presence: true

  enum repeat: [:no, :weekly, :monthly, :yearly]
end
