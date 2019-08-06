require "./config/environment"

class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :seessions
        set :session_secret, "password_security"
    end

    get "/" do
        erb :index
  end

end