class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :email

      t.timestamps
    end
  end
end
