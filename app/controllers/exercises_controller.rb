class ExercisesController < ApplicationController


    get '/exercises' do
        if !logged_in?
            redirect '/'
        else
            @exercises = current_user.exercises
            erb :"/exercises/index"
        end
    end

    get '/exercises/new' do
        erb :'/exercises/new'
    end

    post '/exercises' do

        if !logged_in?
            redirect '/'
        end

        if params[:name] != "" && params[:max_lift] != nil
            # @exercise = Exercise.create(name: params[:exercise],date_performed: params[Date.today], athlete_id: current_user.id)
            @exercise = current_user.exercises.create(name: params[:exercise],max_lift: params[:max_lift], date_performed: params[:Date], athlete_id: current_user.id)
            redirect "/exercises/#{@exercise.id}"
        else
            redirect '/exercises/new'
        end
    end

    get '/exercises/:id' do
        @exercise = Exercise.find_by(id: params[:id])
        erb :'/exercises/show'
    end

    # need to add validation to prevent users from editing anyone's entry
    get '/exercises/:id/edit' do
        # is it possible to substitute :id for the user's username?
        # exercise_entry
        if logged_in?
            @exercise = Exercise.find_by_id(params[:id])
            # this can be abstracted with a helper method
            if @exercise.athlete_id == current_user.id
                erb :'/exercises/edit'
            else
                redirect "athletes/#{current_user.id}"
            end
        else
            redirect '/'
        end
        # binding.pry

    end

    patch '/exercises/:id' do

        # find exercise because @exercise wasn't passed because of patch
        exercise_entry
        if logged_in?
            # this can be abstracted with a helper method
            if @exercise.athlete_id == current_user
                @exercise.update(name: params[:exercise], max_lift: params[:max_lift])
                redirect "/exercises/#{@exercise.id}"
            else
                redirect "athletes/#{current_user.id}"
            end
        else
            redirect "/"
        end
    end


    delete '/exercises/:id' do
        if exercise_entry.athlete_id == current_user
            exercise_entry.delete
            redirect '/exercises'
        else
            redirect '/login'
        end

        # if logged_in?
        #     @exercise = Exercise.find_by_id(params[:id])
        #     @exercise.delete
        #     redirect '/exercises'
        # else
        #     redirect '/login'
        # end
    end


end