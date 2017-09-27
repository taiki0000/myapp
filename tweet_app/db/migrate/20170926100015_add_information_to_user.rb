class AddInformationToUser < ActiveRecord::Migration[5.1]
  def change

    add_column :users, :age, :string
    add_column :users, :belonging, :string
    add_column :users, :course, :string
    add_column :users, :place, :string

  end
end
