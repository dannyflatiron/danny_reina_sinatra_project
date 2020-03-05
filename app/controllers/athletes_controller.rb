class AthletesController < ApplicationController

    # renders login pagee
    get '/login' do
        erb :login
    end

    get '/signup' do
    end

end