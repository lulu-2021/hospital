# Patient who is assigned to a bed may be transferred between rooms,
# either they take their bed with them or they are assigned to another vacant
# bed. Your solution should provide an interface to facilitate this.
class RoomService

  def move_patient_allocate_new_bed(patient_id, new_room_id, free_bed)
    patient = Patient.find(patient_id)
    ward = patient.ward
    bed = patient.bed

    new_room = Room.find(new_room_id)
    new_room_ward = new_room.ward
    # - if the new room is in the same ward allocate the new bed and update the patients ward
    if ward.ward_type == new_room_ward.ward_type
      patient.bed_id = free_bed.id
      patient.ward_id = new_room_ward.id
      patient.save
      puts "Move Completed"
    else
      puts "Move unsuccessful as patients can only be moved to a ward of the correct type"
    end
  end

  def move_patient_keep_bed(patient_id, new_room_id)
    patient = Patient.find(patient_id)
    ward = patient.ward
    bed = patient.bed
    new_room = Room.find(new_room_id)
    new_room_ward = new_room.ward

    # - if the new room is in the same ward move the bed and change the patient
    if ward.ward_type == new_room_ward.ward_type
      bed.room_id = new_room.id
      bed.save

      patient.ward_id = new_room_ward.id
      patient.save
      puts "Move completed!"
    else
      puts "Move unsuccessful as patients can only be moved to a ward of the correct type"
    end
  end
end
