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

        def authenticate
            if !logged_in? || current_user.nil?
                redirect '/login'
            end
        end

        def clean(text)
            Rack::Utils.escape_html(text)
        end

	end

    get '/' do
        redirect '/home' if logged_in?
        erb :index
    end

    get '/home' do
        authenticate
        erb :'users/home'
    end

    not_found do
        @msg = "This resource was not found."
        status 404
        erb :error
    end

    get '/access_denied' do
       @msg = 'Sorry, you can not modify this post.'
       erb :error
      end

end