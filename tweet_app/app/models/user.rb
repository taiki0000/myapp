class User < ApplicationRecord

  #ここでは，.idや.name,.emailなどのメソッドを定義してくれている．

  validates :email, {presence:true}
  validates :email, {uniqueness:true}
  validates :name, {presence:true}
  validates :password, {presence:true,length:{minimum: 4}}

  def posts
    return Post.where(user_id:self.id)
  end

end
