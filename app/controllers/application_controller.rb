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
			User.find_by(id: session[:user_id])
        end

        def authorize
            if !logged_in? || current_user.nil?
                redirect '/login'
            end
        end

        def clean(text)
            Rack::Utils.escape_html(text)
        end

	end

    get '/' do
        erb :index
    end

    get '/home' do
        authorize
        erb :'users/home'
    end

    not_found do
        @msg = "This resource was not found."
        status 404
        erb :error
    end

end