class Post < ApplicationRecord
  #ここでは，.idや.contentなどのメソッドを定義してくれている．

  validates :content, {presence:true,length:{maximum: 140}}
  validates :user_id, {presence:true}

    #userメソッドを実行する変数したいのIDを取得
  def user
    return User.find_by(id:self.user_id)
  end
end

