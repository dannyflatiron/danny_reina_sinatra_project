class ExercisesController < ApplicationController

    get '/exercises/new' do
        erb :'/exercises/new'
    end

    post '/exercises' do
        if !logged_in?
            redirect '/'
        end

        if params[:name] != "" && params[:max_lift] != nil
            @exercise = Exercise.create(name: params[:exercise], athlete_id: current_user.id)
            redirect "/exercises/#{@exercise.id}"
        else
            redirect '/exercises/new'
        end
    end

    get '/exercises/:id' do
        @exercise = Exercise.find_by(params[:id])
        erb :'/exercises/show'
    end

    get '/exercises/:id/edit' do
        # is it possible to substitute :id for the user's username?
        @exercise = Exercise.find_by(params[:id])
        erb :'/exercises/edit'
    end

    patch '/exercises/:id' do
        "Hello World"
    end



end