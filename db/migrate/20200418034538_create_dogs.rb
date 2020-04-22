class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :color
      t.text :specialconcerns
      t.string :rabies
      t.integer :breed_id
      t.integer :client_id

      t.timestamps
    end
  end
end
