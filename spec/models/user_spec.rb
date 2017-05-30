require 'rails_helper'

Rspec.describe User, type: :model do

  it { should have_many(:job_listings) }

end