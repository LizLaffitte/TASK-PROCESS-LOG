require './config/environment'

class UsersController <  ApplicationController

    get '/users/home' do
        @worker = Worker.find(session[:user_id])
        erb :'/users/home'
      end
      
      get '/users/failure' do
        erb :'/users/failure'
      end

end