require './config/environment'


class JobsController < ApplicationController

    get '/jobs' do 
        # index displays all jobs
        @jobs = Job.all
        erb :'/jobs/index'
    end

    get '/jobs/new' do
        #create new job form
        @tasks = Task.all
        erb :'/jobs/new'
        
    end

    post '/jobs' do
        #create one new job (button action)
        @job = Job.create(:name => params[:job][:name])
        redirect to "/jobs/#{@job.id}"
    end

    get '/jobs/:id' do
        # displays job with :id
        @job = Job.find_by_id(params[:id])
        erb :'jobs/show'
    end

    get '/jobs/:id/edit' do
        # edit jobs form
        @job = Job.find_by_id(params[:id])
        erb :'jobs/edit'
    end

    patch '/jobs/:id' do
        #modifies job with :id
        @job = Job.find_by_id(params[:id])
        @job.name = params[:job][:name]
        binding.pry
        @job.save
        redirect to "/jobs/#{@job.id}"
    end

    put '/jobs/:id' do
        # replaces job

    end

    delete '/jobs/:id' do
        # deletes job with :id
        @job = Job.find_by_id(params[:id])
        @job.delete
        redirect to '/jobs'
    end




end