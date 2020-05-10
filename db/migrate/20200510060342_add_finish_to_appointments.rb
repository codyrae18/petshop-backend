class AddFinishToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :finish, :boolean
  end
end
