require 'rails_helper'

RSpec.describe JobListing, type: :model do

  it { should belong_to(:user) }

  it do
    should validate_presence_of(:user_id) 
    should validate_numericality_of(:user_id)
  end

  it { should validate_presence_of(:position) }

  it do
     should validate_presence_of(:salary) 
     should validate_numericality_of(:salary)

  end

  it { should validate_presence_of(:description) }

end