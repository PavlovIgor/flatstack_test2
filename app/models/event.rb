class Event < ApplicationRecord
  include TranslateEnum

  belongs_to :user

  scope :not_repeat,  -> { where(repeat: :no_repeat) }
  scope :weekly,  -> { where(repeat: :weekly) }
  scope :monthly,  -> { where(repeat: :monthly) }
  scope :yearly,  -> { where(repeat: :yearly) }
  scope :between, ->(start, stop) { where('date >= ? AND date <= ?', start, stop) }
  scope :dow, ->(date) { where('date <= ? AND extract(dow from date) in (?)', date, date.wday) }
  scope :dom, ->(date) { where('date <= ? AND extract(day from date) in (?)', date, date.mday) }
  scope :doy, ->(date) { where('date <= ? AND extract(doy from date) in (?)', date, date.yday) }

  validates :name, :date, :repeat, presence: true

  enum repeat: [:no_repeat, :weekly, :monthly, :yearly]
  translate_enum :repeat

  def truncated
    description.truncate(100, separator: ' ')
  end

end
