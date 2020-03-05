require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



#in order to send patch and delete requests add Rack Method Override
use Rack::MethodOverride

#mount other controllers here
# use AthleteController
# use ExercisesController
run ApplicationController
