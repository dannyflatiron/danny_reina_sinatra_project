# here test data is created to work with and test associations


danny = Athlete.create(username: "Danny", password: "password")
mary = Athlete.create(username: "Mary", password: "password")

Exercise.create(name: "squat", date_performed: "", athlete_id: danny.id)

