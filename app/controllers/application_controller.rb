require "./config/environment"

class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "password_security"
    end

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find_by(session[:user_id])
		end
	end

    get "/" do
        erb :index
  end
  

end