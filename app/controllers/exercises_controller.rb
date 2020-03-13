class ExercisesController < ApplicationController


    get '/exercises' do
        redirect_if_not_logged_in
            @exercises = current_user.exercises
            erb :"/exercises/index"
    end

    get '/exercises/new' do
        redirect_if_not_logged_in
        exercise_entry
        erb :'/exercises/new'
    end

    post '/exercises' do
        redirect_if_not_logged_in
        if !params[:exercise].empty? && !params[:max_lift].empty?
            @exercise = current_user.exercises.create(name: params[:exercise], max_lift: params[:max_lift], date_performed: Date.today, athlete_id: current_user.id)
                if @exercise.save
                    flash[:message] = "Your performance has been saved!"
                    redirect "/exercises/#{@exercise.id}"
                else
                    flash[:error] = "Invalid entry. Please enter exercise name and the amount of weight lifted."
                    redirect "/exercises/new"
                end
        else
            flash[:message] = "Invalid entry. Please enter exercise name and the amount of weight lifted."
            redirect "/exercises/new"
        end
    end

    get '/exercises/:id' do
        exercise_entry
        erb :'/exercises/show'
    end

    get '/exercises/:id/edit' do
        # is it possible to substitute :id for the user's username?
        redirect_if_not_logged_in
        exercise_entry
            if @exercise.athlete_id == current_user.id
                erb :'/exercises/edit'
            else
                flash[:error] = "You are not allowed to edit another user's property"
                redirect "athletes/#{current_user.id}"
            end
    end

    patch '/exercises/:id' do        
        redirect_if_not_logged_in
        exercise_entry
            if @exercise.athlete_id == current_user.id && !params[:exercise].empty? && !params[:max_lift].empty?
                @exercise.update(name: params[:exercise], max_lift: params[:max_lift],)
                flash[:message] = "Your performance has been updated!"
                redirect "/exercises/#{@exercise.id}"
            else
                flash[:error] = "Please enter valid entries. Name for exercise and number for weight lifted."
                # redirect "athletes/#{current_user.id}"
                redirect "/exercises/#{@exercise.id}"
            end
    end


    delete '/exercises/:id' do
        redirect_if_not_logged_in
        exercise_entry
            if @exercise && @exercise.athlete_id == current_user.id
                @exercise.destroy
                flash[:message] = "Your performance has been deleted!"
                redirect "/exercises"
            else
                flash[:error] = "You cannot delete performance for another user!"
                redirect "/exercises"
            end
    end


end