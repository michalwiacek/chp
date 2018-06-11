require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = build(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it 'has a uniqe email' do
    user2 = build(:user, email: "bob@gmail.com")
    expect(user2).to be_valid
  end

  it 'is not valid without email' do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid with first name longer then 100' do
    user3 = build(:user, first_name: "nabuhonodozor" * 8)
    expect(user3).to_not be_valid
  end

  it 'is not valid without first name' do
    user3 = build(:user, first_name: nil)
    expect(user3).to_not be_valid
  end

  it 'is not valid with last name longer then 100' do
    user4 = build(:user, last_name: "nabuhonodozor" * 8)
    expect(user4).to_not be_valid
  end

  it 'is not valid without last name' do
    user4 = build(:user, last_name: nil)
    expect(user4).to_not be_valid
  end

  it 'is valid without birth date' do
    user5 = build(:user, email: "abc@abc.em", birth_date: nil)
    expect(user5).to be_valid
  end

  it 'is valid without phone number' do
    user5 = build(:user, email: "abc@abc.em", phone: nil)
    expect(user5).to be_valid
  end

end
