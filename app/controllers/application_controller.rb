require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bricks_@_flatiron"
    use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/athletes/#{current_user.id}"
    else
      erb :welcome
    end
    
  end

  helpers do

    # this should return true or false not the value of current_user
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Athlete.find_by(id: session[:athlete_id])
    end

    def exercise_entry
      @exercise = Exercise.find_by_id(params[:id])
      # @exercise = current_user.exercises.find_by(params[:id])
    end
  end

  

end
