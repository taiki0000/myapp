class User < ApplicationRecord

  #ここでは，.idや.name,.emailなどのメソッドを定義してくれている．

  validates :email, {presence:true}
  validates :email, {uniqueness:true}
  validates :name, {presence:true}
  validates :password, {presence:true,length:{minimum: 4}}

end
