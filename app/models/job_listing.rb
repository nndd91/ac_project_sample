class JobListing < ApplicationRecord

  belongs_to :user
  validates :user_id, numericality: true, presence: true
  validates :position, presence: true
  validates :salary, presence: true, numericality: true
  validates :description, presence: true

end
