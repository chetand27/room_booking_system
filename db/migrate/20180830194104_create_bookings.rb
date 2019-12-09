class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id, index: true
      t.integer :room_id, index: true
      t.date :booked_from
      t.date :booked_upto
      t.timestamps
    end
  end
end
