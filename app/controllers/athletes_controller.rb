class AthletesController < ApplicationController

    # renders login pagee
    get '/login' do
        erb :login
    end

    post '/login' do
        @athlete = Athlete.find_by(username: params[:username])
        if @athlete && @athlete.authenticate(params[:password]) 
            session[:athlete_id] = @athlete.id
            flash[:message] = "Welcome, #{@athlete.username}!"
            redirect "/athletes/#{@athlete.id}"
        else
            flash[:error] = "Your credentials were invalid. Please sign up or try again."
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
            @athlete = Athlete.new(params)
            if @athlete.save && params[:username] != "" && params[:password] != ""
                session[:athlete_id] = @athlete.id
                flash[:message] = "You have successfully created a new account!"
                redirect "/athletes/#{@athlete.id}"
            else
                flash[:error] = "Account creation failure: #{@athlete.errors.full_messages.to_sentence}!"
                redirect '/signup'
            end
    end

    get '/athletes/:id' do
        # how to show user's username in the url?
        redirect_if_not_logged_in
        @athlete = Athlete.find_by(id: params[:id])
        erb :'/athletes/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end