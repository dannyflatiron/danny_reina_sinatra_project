# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
ActiveRecord inheritance in models
- [x] Include more than one model class (e.g. User, Post, Category)
Athlete and Exercise
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
an Athlete has many exercises
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
Exercise belongs to an Athlete
- [x] Include user accounts with unique login attribute (username or email)
has_secure_password & validates_uniqueness_of :username
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users
ensure that edit and delete actions can only happen if current user owns the entry
- [x] Include user input validations
prevent bad data entry such as blank user
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
50+
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
