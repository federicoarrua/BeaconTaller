# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MajorRegion.create(major_id:4660,description:"Esta región es usada para referenciar a todos los beacons del primer piso")
MinorRegion.create(minor_id:64001,description:"Esta región es usada para referenciar a todos los beacons del primer aula de cada piso")
Beacon.create(major_id:4660,minor_id:64001,description:"Encontraste el beacon con major y minor 1,1 Felicidades!!")

Device.create(device_id:"example@mail.com")
User.create(email:"example@mail.com",password:"password",password_confirmation:"password")
