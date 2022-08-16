class User < ApplicationRecord
  # email 是否為唯一
  validates :email, presence: true, uniqueness: true
  # password 
  validates :password, presence: true, length: {minimum: 6}, confirmation: true

  # callback
  # 密碼存進資料庫前要做的事情,建立之前先加鹽
  before_create :encrypt_password

  private
  def encrypt_password
    # require "digest" 已經被rails require進來了
    # salting
    # self 指的是User自己 User就是我剛剛在controller def create 裡的東西
    pw = "xx-#{self.password}yy"
    self.password = Digest::SHA1.hexdigest(pw)
  end
end
