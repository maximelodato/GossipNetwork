class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
