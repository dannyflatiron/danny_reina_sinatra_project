class Athlete < ActiveRecord::Base
    # has_secure_password allows the use of an ActiveRecord method called Authenticate which takes a password as a plain string and checks it against gem bcrypts hashing algorithm to make sure its the correct password
    has_secure_password
    has_many :exercises
    validates_uniqueness_of :username, { message: "already taken" }
end
