require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end



  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

  end

  get '/' do
    if logged_in?
      redirect to "/users/home"
    else
      erb :home
    end
  end

  get '/tasks_by_job' do
    @jobs = Job.all
    erb :'/tasks/index_by_job'
  end

  get '/tasks_by_global_processes' do
    @global_processes = GlobalProcess.all
    erb :'/tasks/index_by_global_processes'
  end

  

end
