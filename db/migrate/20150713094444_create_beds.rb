class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds, :id => :uuid do |t|
      t.uuid :room_id, index: true, foreign_key: true
      t.uuid :patient_id, index: true, foreign_key: true
      t.string :identifier, limit: 50 # - this is unique identifier such as a bed number or reference - readable English
      t.timestamps null: false
    end
    add_index :beds, :identifier, unique: true # - and to ensure race conditions don't occur we add a unique index
  end
end
