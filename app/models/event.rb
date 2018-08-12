class Event < ApplicationRecord
  include TranslateEnum

  belongs_to :user

  scope :not_repeat,  -> { where(repeat: :no_repeat) }
  scope :weekly,  -> { where(repeat: :weekly) }
  scope :monthly,  -> { where(repeat: :monthly) }
  scope :yearly,  -> { where(repeat: :yearly) }
  scope :between, ->(start, stop) { where('date >= ? AND date <= ?', start, stop) }
  scope :dow, ->(dow) { where('extract(dow from date) in (?)', dow) }
  scope :dom, ->(dom) { where('extract(day from date) in (?)', dom) }
  scope :doy, ->(doy) { where('extract(doy from date) in (?)', doy) }

  validates :name, :date, :repeat, presence: true

  enum repeat: [:no_repeat, :weekly, :monthly, :yearly]
  translate_enum :repeat

  def truncated
    description.truncate(100, separator: ' ')
  end

end
