# here test data is created to work with and test associations


Athlete.create(username: "Danny", password: "password")
Athlete.create(username: "Mary", password: "password")


Exercise.create(name: "barbell squat", date_performed: "Mar 1 2020", max_lift: 300, athlete_id: Athlete.first.id)
Exercise.create(name: "barbell curls", date_performed: "Feb 4 2020", max_lift: 60, athlete_id: Athlete.first.id)
Exercise.create(name: "goblet squats", date_performed: "Jan 28 2020", max_lift: 60, athlete_id: Athlete.last.id)


