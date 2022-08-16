class User < ApplicationRecord
  # email 是否為唯一
  validates :email, presence: true, uniqueness: true
  # password 
  validates :password, presence: true, length: {minimum: 6}, confirmation: true

  # 登入判斷
  # ruby 3 可以這樣寫
  #def self.login(email:, password:)
  def self.login(user_params)
    email = user_params[:email]
    password = user_params[:password]

    hashed_password = Digest::SHA1.hexdigest("xx-#{password}yy")
    find_by(email: email, password: hashed_password)
  end


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
