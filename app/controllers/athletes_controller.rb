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
            # how to add error messages/validation features?
            redirect '/login'
        end
        erb :login
    end 

    # render signup form, the form should be able to capture usere's data to create a params hash
    get '/signup' do
        erb :signup
    end

    post '/athletes' do
        # create new athlete here
        if params[:username] != "" && params[:password] != ""
            @athlete = Athlete.create(params)
            redirect "/athletes/#{@athlete.id}"
            erb :'/athletes/show'
        else
        end
    end

    get '/athletes/:id' do
        erb :'/athletes/show'
    end
end