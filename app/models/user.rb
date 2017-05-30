class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :job_listings

  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 25 }
  validates :first_name, presence: true
  validates :second_name, presence: true

  #username, first_name, last_name
  #empty username?, duplicate usernames? special characters? 
end
