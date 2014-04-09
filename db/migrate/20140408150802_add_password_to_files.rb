class AddPasswordToFiles < ActiveRecord::Migration
  def change
    add_column :files, :Password, :string
  end
end
