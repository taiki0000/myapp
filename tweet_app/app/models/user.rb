class User < ApplicationRecord

  #ここでは，.idや.name,.emailなどのメソッドを定義してくれている．

  #暗号化
  has_secure_password

  validates :email, {presence:true}
  validates :email, {uniqueness:true}
  validates :name, {presence:true}

  def posts
    return Post.where(user_id:self.id)
  end

end
