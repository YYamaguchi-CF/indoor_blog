class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :introduce
      t.string :email
      t.string :password_digest
      t.string :image

      t.timestamps
    end
  end
end
