class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :lastname
      t.string :firstname
      t.integer :homephone
      t.integer :workphone
      t.timestamps
    end
  end
end
