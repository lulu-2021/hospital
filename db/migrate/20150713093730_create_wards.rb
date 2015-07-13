class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards, :id => :uuid do |t|
      t.string :identifier, limit: 50 # - this is unique identifier such as a ward_id - readable English
      t.string :ward_type # - this will have the child object name to identify the type of ward
                             # - i.e. EmergencyWard,   InfectiousWard (We will use Rails STI)

      t.timestamps null: false
    end
    add_index :wards, :identifier, unique: true # - and to ensure race conditions don't occur we add a unique index
  end
end
