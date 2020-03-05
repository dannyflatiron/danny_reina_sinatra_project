class AthletesController < ApplicationController

    # renders login pagee
    get '/login' do
        erb :login
    end

    # this creates a session hash
    # finds the user 
    # logins them in 
    # receives data from form to create a session hash
    # redirects user to landing page
    # authenticate the user
    # authenticate password
    post '/login' do
        @athlete = Athlete.find_by(username: params[:username])
        if @athlete.authenticate(params[:password])
            session[:athlete_id] = @athlete.id
            # use double quotations for line 20 to work
            redirect "/athletes/#{@athlete.id}"
        else
        end
        erb :login
    end

    get '/signup' do
    end

    get '/athletes/:id' do
        "Athlete's page"
    end
end