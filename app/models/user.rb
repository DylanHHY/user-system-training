class User < ApplicationRecord
  # email 是否為唯一
  validates :email, presence: true, uniqueness: true
  # password 
  validates :password, presence: true, length: {minimum: 6}, confirmation: true

end
