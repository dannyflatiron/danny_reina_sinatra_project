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
        if logged_in?
            @athlete = Athlete.find_by(id: params[:id])
        erb :'/exercises/new'
        else
            redirect '/'
        end
    end

    post '/exercises' do
        if !logged_in?
            redirect '/'
        end
        # if params[:name] != "" && params[:max_lift] != nil
        #     # @exercise = Exercise.create(name: params[:exercise],date_performed: params[Date.today], athlete_id: current_user.id)
        #     @exercise = current_user.exercises.create(name: params[:exercise], max_lift: params[:max_lift], date_performed: Date.today, athlete_id: current_user.id)
        #     redirect "/exercises/#{@exercise.id}"
        # else
        #     redirect '/exercises/new'
        # end
        # binding.pry
        if !params[:exercise].empty? && !params[:max_lift].empty?
            @exercise = current_user.exercises.create(name: params[:exercise], max_lift: params[:max_lift], date_performed: Date.today, athlete_id: current_user.id)
                if @exercise.save
                    flash[:message] = "Your performance has been saved"
                    redirect "/exercises/#{@exercise.id}"
                else
                    flash[:message] = "Invalid entry. Please enter exercise name and the amount of weight lifted."
                    redirect "/exercises/new"
                end
        else
            flash[:message] = "Invalid entry. Please enter exercise name and the amount of weight lifted."
            redirect "/exercises/new"
        end
    end

    get '/exercises/:id' do
        # if logged_in?
        #     @exercise = Exercise.find_by(id: params[:id])
        #     binding.pry

        #     if
        #         @exercise.athlete_id == current_user.id
        #         erb :'/exercises/show'
        #     else
        #         redirect "athletes/#{current_user.id}"
        #     end
        #         redirect '/'
        # else
        #     redirect '/'
        # end

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
                flash[:message] = "You are not allowed to edit another user's property"
                redirect "athletes/#{current_user.id}"
            end
        else
            redirect '/'
        end
        # binding.pry

    end

    patch '/exercises/:id' do

        # find exercise because @exercise wasn't passed because of patch
        
        if logged_in?
            @exercise = Exercise.find_by_id(params[:id])
            # this can be abstracted with a helper method
            if @exercise.athlete_id == current_user.id && !params[:exercise].empty? && !params[:max_lift].empty?
                @exercise.update(name: params[:exercise], max_lift: params[:max_lift])
                flash[:message] = "Your performance has been updated!"
                redirect "/exercises/#{@exercise.id}"
            else
                flash[:message] = "Please enter valid entries. Name for exercise and number for weight lifted."
                # redirect "athletes/#{current_user.id}"
                redirect "/exercises/#{@exercise.id}"
            end
        else
            redirect "/"
        end
    end


    delete '/exercises/:id' do
        # if exercise_entry.athlete_id == current_user
        #     exercise_entry.delete
        # should I use delete or destroy
        #     redirect '/exercises'
        # else
        #     redirect '/login'
        # end

        if logged_in?
            @exercise = current_user.exercises.find_by(params[:id])
            if @exercise.athlete_id == current_user.id
                @exercise.destroy
                flash[:message] = "Your performance has been deleted!"
                redirect '/exercises'
            else
                flash[:message] = "You cannot delete performance for another user!"
                redirect "/athletes/#{current_user.id}"
            end
        else
            redirect '/login'
        end
    end


end