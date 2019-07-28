class Job < ApplicationRecord
  belongs_to :user
  # serialize :rre, JSON 
end
