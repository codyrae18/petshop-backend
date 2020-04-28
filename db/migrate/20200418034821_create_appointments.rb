class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :type
      t.integer :pet_id
      t.integer :service_id
      t.timestamps
    end
  end
end
