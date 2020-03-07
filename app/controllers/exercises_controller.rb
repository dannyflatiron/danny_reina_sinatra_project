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
        exercise
        erb :'/exercises/show'
    end

    # need to add validation to prevent users from editing anyone's entry
    get '/exercises/:id/edit' do
        # is it possible to substitute :id for the user's username?
        exercise
        if logged_in?
            if @exercise.athlete == current_user
                erb :'/exercises/edit'
            else
                redirect "athletes/#{current_user.id}"
            end
        else
            redirect '/'
        end
        
    end

    patch '/exercises/:id' do
        # find exercise because @exercise wasn't passed because of patch
        exercise
        if logged_in?
            if @exercise.athlete == current_userf 
                @exercise.update(name: params[:exercise], max_lift: params[:max_lift])
                redirect "/exercises/#{@exercise.id}"
            else
                redirect "athletes/#{current_user.id}"
            end
        else
            redirect "/"
        end
    end

    private

    def exercise
        @exercise = Exercise.find_by(params[:id])
    end


end