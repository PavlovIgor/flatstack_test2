require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:user) { create :user }
  let!(:today) { Date.today }
  let!(:yesterday) { Date.today - 1.day }
  let!(:tomorrow) { Date.today + 1.day }

  let!(:week_later) { Date.today + 7.day }
  let!(:month_later) { Date.today + 1.month }
  let!(:year_later) { Date.today + 1.year }
  let!(:week_ago) { Date.today - 7.day }
  let!(:month_ago) { Date.today - 1.month }
  let!(:year_ago) { Date.today - 1.year }

  let!(:event) { create :event, user: user }
  let!(:empty_name_user) { build :event, :empty_name, user: user }
  let!(:empty_date_user) { build :event, :empty_date, user: user }
  let!(:empty_repeat_user) { build :event, :empty_repeat, user: user }

  let!(:event_not_repeat) { create :event, :not_repeat, user: user }
  let!(:event_weekly) { create :event, :weekly, user: user }
  let!(:event_monthly) { create :event, :monthly, user: user }
  let!(:event_yearly) { create :event, :yearly, user: user }

  # Validations
  it { expect(event).to be_valid }
  it { expect(empty_name_user).not_to be_valid }
  it { expect(empty_date_user).not_to be_valid }
  it { expect(empty_repeat_user).not_to be_valid }

  # Scopes
  it { expect(event_not_repeat).to be_in(Event.not_repeat) }
  it { expect(event_weekly).to be_in(Event.weekly) }
  it { expect(event_monthly).to be_in(Event.monthly) }
  it { expect(event_yearly).to be_in(Event.yearly) }

  it { expect(event_not_repeat).not_to be_in(Event.weekly) }
  it { expect(event_not_repeat).not_to be_in(Event.monthly) }
  it { expect(event_not_repeat).not_to be_in(Event.yearly) }

  it { expect(event_weekly).not_to be_in(Event.not_repeat) }
  it { expect(event_weekly).not_to be_in(Event.monthly) }
  it { expect(event_weekly).not_to be_in(Event.yearly) }

  it { expect(event_monthly).not_to be_in(Event.not_repeat) }
  it { expect(event_monthly).not_to be_in(Event.weekly) }
  it { expect(event_monthly).not_to be_in(Event.yearly) }

  it { expect(event_yearly).not_to be_in(Event.not_repeat) }
  it { expect(event_yearly).not_to be_in(Event.weekly) }
  it { expect(event_yearly).not_to be_in(Event.monthly) }

  it { expect(event).to be_in(Event.between(yesterday, tomorrow)) }
  it { expect(event).not_to be_in(Event.between(tomorrow, yesterday)) }

  it { expect(event).to be_in(Event.dow(week_later)) }
  it { expect(event).not_to be_in(Event.dow(week_ago)) }

  it { expect(event).to be_in(Event.dom(month_later)) }
  it { expect(event).not_to be_in(Event.dom(month_ago)) }

  it { expect(event).to be_in(Event.doy(year_later)) }
  it { expect(event).not_to be_in(Event.doy(year_ago)) }
end
