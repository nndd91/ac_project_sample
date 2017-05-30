require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:job_listings) }
  it { should validate_presence_of(:username) }

  describe 'validate uniqueness of' do
    subject { User.create(username: 'andy123', email: 'email@example.com', password: '1234567', first_name: 'Joe', last_name: 'Tan')}
    it { should validate_uniqueness_of(:username) }
  end

  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it do
    should validate_length_of(:username).
                 is_at_least(3).
                 is_at_most(25).
                 on(:create)
  end

  
end