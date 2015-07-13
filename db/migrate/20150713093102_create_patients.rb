class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients, :id => :uuid do |t|
      t.uuid :ward_id, index: true, foreign_key: true
      t.string :identifier, limit: 50 # - this is unique identifier such as a patient_id - readable English
      t.string :patient_type # - this will have the child object name to identify the type of patient
                             # - i.e. EmergencyPatient,   InfectiousPatient (We will use Rails STI)
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50

      t.timestamps null: false
    end
    add_index :patients, :identifier, unique: true # - and to ensure race conditions don't occur we add a unique index
  end
end
