# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.create(device_id:"example@mail.com")
u = User.create(email:"example@mail.com",password:"password",password_confirmation:"password")
u2 = User.create(email:"example2@mail.com",password:"password",password_confirmation:"password")

MajorRegion.create(user_id:u.id,major_id:4660,description:"Esta región es usada para referenciar a todos los beacons del primer piso")
MinorRegion.create(user_id:u.id,minor_id:64001,description:"Esta región es usada para referenciar a todos los beacons del primer aula de cada piso")
Beacon.create(user_id:u.id,name:"Primer beacon",major_region_id:4660,minor_region_id:64001,description:"Encontraste el beacon con major y minor  Felicidades!!")

MajorRegion.create(user_id:u2.id,major_id:1,description:"Esta región es usada para referenciar a todos los beacons del primer piso")
MinorRegion.create(user_id:u2.id,minor_id:1,description:"Esta región es usada para referenciar a todos los beacons del primer aula de cada piso")
Beacon.create(user_id:u2.id,name:"Segundo Beacon",major_region_id:1,minor_region_id:1,description:"Encontraste el beacon con major y minor 1,1 Felicidades!!")

