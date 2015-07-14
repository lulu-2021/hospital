# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stable_ward = StableWard.create(identifier: 'StableWard01')
emergency_ward = EmergencyWard.create(identifier: 'EmergencyWard01')
recovery_ward = RecoveryWard.create(identifier: 'RecoveryWard01')
#
room1 = stable_ward.rooms.create(identifier: 'room1')
room2 = stable_ward.rooms.create(identifier: 'room2')
#
room3 = emergency_ward.rooms.create(identifier: 'room3')
room4 = emergency_ward.rooms.create(identifier: 'room4')
#
room5 = recovery_ward.rooms.create(identifier: 'room5')
room6 = recovery_ward.rooms.create(identifier: 'room6')
#
bed1 = room1.beds.create(identifier: 'Bed1')
bed2 = room1.beds.create(identifier: 'Bed2')
#
bed3 = room2.beds.create(identifier: 'Bed3')
bed4 = room2.beds.create(identifier: 'Bed4')
#
bed5 = room3.beds.create(identifier: 'Bed5')
bed6 = room3.beds.create(identifier: 'Bed6')
#
bed7 = room4.beds.create(identifier: 'Bed7')
bed8 = room4.beds.create(identifier: 'Bed8')
#
bed9 = room5.beds.create(identifier: 'Bed9')
bed10 = room5.beds.create(identifier: 'Bed10')
#
bed11 = room6.beds.create(identifier: 'Bed11')
bed12 = room6.beds.create(identifier: 'Bed12')
#
p1 = StablePatient.create(identifier: 'patient01', bed_id: bed1.id, ward_id: stable_ward.id)
#
p2 = RecoveryPatient.create(identifier: 'patient02', bed_id: bed9.id, ward_id: recovery_ward.id)
#
