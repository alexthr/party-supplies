class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_available
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end
