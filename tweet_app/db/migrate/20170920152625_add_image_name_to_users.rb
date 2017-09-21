class AddImageNameToUsers < ActiveRecord::Migration[5.1]
  def change
#命令，テーブル名，そのカラムの名前，そのデータの型
    add_column :users, :image_name, :string

  end
end
