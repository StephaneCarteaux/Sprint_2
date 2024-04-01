// query 1
db.restaurants.find()
// query 2
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 })
// query 3
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })
// query 4
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1, _id: 0 })
// query 5
db.restaurants.find({ borough: "Bronx" })
// query 6
db.restaurants.find({ borough: "Bronx" }).limit(5)
// query 7
db.restaurants.find({ borough: "Bronx" }).limit(5).skip(5)
// query 8
db.restaurants.find({ "grades.score": { $gt: 90 } })
// query 9
db.restaurants.find({ "grades": { $elemMatch: { "score": { $gt: 80, $lt: 100 } } } })
// query 10
db.restaurants.find({ "address.coord.0": { $lt: -95.754168 } })
// query 11 - el enunciado dice latitud pero entiendo que está equivocado así que lo hice con longitud...
db.restaurants.find({ $and: [{ "grades.score": { $gt: 70 } }, { "cuisine": { $ne: "American " } }, { "address.coord.0": { $lt: -65.754168 } }] })
// query 12
db.restaurants.find({ "grades.score": { $gt: 70 }, "cuisine": { $ne: "American " }, "address.coord.0": { $lt: -65.754168 } })
// query 13
db.restaurants.find( { cuisine: { $ne: 'American '}, 'grades.grade': 'A', borough: {$ne: 'Brooklyn'} }).sort( {cuisine: -1} )
// query 14
db.restaurants.find( {name: /^Wil/}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 15
db.restaurants.find( {name: /ces$/}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 16
db.restaurants.find( {name: /Reg/}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 17
db.restaurants.find( {borough: 'Bronx', $or: [ { cuisine: 'American '}, { cuisine: 'Chinese' } ] } )
// query 18
db.restaurants.find( { borough: { $in: [ 'Staten Island', 'Queens', 'Bronx', 'Brooklyn' ] } }, { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 19
db.restaurants.find( { borough: { $nin: [ 'Staten Island', 'Queens', 'Bronx', 'Brooklyn' ] } }, { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 20
db.restaurants.find( { 'grades.score': { $lt:10 } }, { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 21
db.restaurants.find( { cuisine: 'Seafood', $nor: [ { cuisine: 'American ' }, { cuisine: 'Chinese '}, { name: /^Will/ } ] }, { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } )
// query 22
db.restaurants.find( { grades: { $elemMatch: {'grade': 'A', 'score': 11, 'date': ISODate("2014-08-11T00:00:00Z" ) } } }, { _id: 0, restaurant_id: 1, name: 1, grades: 1 } )
// query 23
db.restaurants.find( { 'grades.1.grade': 'A', 'grades.1.score': 9, 'grades.1.date': ISODate("2014-08-11T00:00:00Z") }, { _id: 0, restaurant_id: 1, name: 1, grades: 1 } )
// query 24
db.restaurants.find( { 'address.coord.1': { $gt: 42, $lt: 52 } }, { _id: 0, restaurant_id: 1, name: 1, address: 1 } )
// query 25
db.restaurants.find().sort( { name: 1 } )
// query 26
db.restaurants.find().sort( { name: -1 } )
// query 27
db.restaurants.find().sort( { cuisine: 1, borough: -1 } )
// query 28
db.restaurants.find( { 'address.street': { $exists: 1 } } )
// query 29
db.restaurants.find( { 'address.coord': { $type: 'double' } } )
// query 30
db.restaurants.find( { 'grades.score': { $mod: [7, 0] } }, { _id:0, restaurant_id: 1, name: 1, grades: 1 } )
// query 31
db.restaurants.find( { name: /mon/ }, { _id:0, name: 1, borough: 1, 'address.coord': 1, cuisine: 1 } )
// query 32
db.restaurants.find( { name: /^Mad/ }, { _id:0, name: 1, borough: 1, 'address.coord': 1, cuisine: 1 } )