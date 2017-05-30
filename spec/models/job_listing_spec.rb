require 'rails_helper'

RSpec.describe JobListing, type: :model do

  it { should belong_to(:user) }

  
end