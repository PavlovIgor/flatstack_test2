require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { build :user }
  let!(:empty_email_user) { build :user, :empty_email }
  let!(:empty_full_name_user) { build :user, :empty_full_name }
  let!(:empty_password_user) { build :user, :empty_password }
  let!(:empty_password_confirmation_user) { build :user, :empty_password_confirmation }

  it { expect(user).to be_valid }
  it { expect(empty_email_user).not_to be_valid }
  it { expect(empty_full_name_user).not_to be_valid }
  it { expect(empty_password_user).not_to be_valid }
  it { expect(empty_password_confirmation_user).not_to be_valid }
end
