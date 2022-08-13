class User < ApplicationRecord
  validates :email, presence: true
  # password 
  validates :password, presence: true, length: {minimum: 6}, confirmation: true
  
end
