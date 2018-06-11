require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:all) do
    @company1 = create(:company)
  end
  it 'is valid with a name' do
    expect(@company1).to be_valid
  end

  it 'is not valid with a name longer then 200 characters' do
    company2 = build(:company, name: 'David Goggins' * 16)
    expect(company2).not_to be_valid
  end

  it 'is not valid without name' do
    company2 = build(:company, name: nil)
    expect(company2).not_to be_valid
  end
end
