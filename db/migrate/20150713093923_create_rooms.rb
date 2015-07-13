class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms, :id => :uuid do |t|
      t.uuid :ward_id, index: true, foreign_key: true
      t.string :identifier, limit: 50 # - this is unique identifier such as a room_id - readable English
      t.integer :beds_count, :default => 0 # - maintain a counter_cache for the number of beds!
    end
    add_index :rooms, :identifier, unique: true # - and to ensure race conditions don't occur we add a unique index
  end
end
