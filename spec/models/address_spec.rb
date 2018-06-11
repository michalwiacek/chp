require 'rails_helper'

RSpec.describe Address, type: :model do
  before(:all) do
    @user_address = create(:user_address)
    @company_address = create(:company_address)
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
  it 'is valid user address' do
    expect(@user_address).to be_valid
  end
  it 'is valid company address' do
    expect(@company_address).to be_valid
  end
  # it 'is not valid without attr' do
  #   user_address1 = build(:user_address, street: nil)
  #   expect(user_address1).not_to be_valid
  # end
end
