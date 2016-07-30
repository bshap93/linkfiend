class ListsController < ApplicationController


  get '/lists/new' do
    if logged_in?
      erb :'lists/new'
    else
      redirect to "/login"
    end
  end

  post '/lists' do
    if !params[:name].empty?
      @list = List.new(name: params[:name], user: current_user)
      if params[:user]
        params[:user][:bookmark_ids].each do |bookmark_id|
          @list.bookmarks << Bookmark.find(bookmark_id)
        end
      end
      @list.save
      redirect to "/lists"
    else
      flash[:message] = "No name given to list"
      redirect to "/failure"
    end
  end

  get '/lists' do
    if logged_in?
      erb :'lists/index'
    else
      redirect to "/login"
    end
    
  end

  get '/lists/my' do
    if logged_in?
      erb :'lists/my_lists'
    else
      redirect to "/login"
    end
  end

  get '/lists/:slug' do
    if logged_in?
      @list = List.find_by_slug(params[:slug])
      erb :'lists/show'
    else
      redirect to "/login"
    end
  end

  get '/lists/:slug/edit' do
    if logged_in?
      @list = List.find_by_slug(params[:slug])
      erb :'lists/edit'
    else
      redirect to "/login"
    end
  end    

  patch '/lists/:slug/edit' do
    if !params[:name].empty?
      @list = List.find_by_slug(params[:slug])
      @list.update(name: params[:name])
      @list.bookmarks.clear
      if params[:user]
        params[:user][:bookmark_ids].each do |bookmark_id|
          @list.bookmarks << Bookmark.find(bookmark_id)
        end
      end
      @list.save
      redirect to "/lists"
    else
      flash[:message] = "No name given to list"
      redirect to "/failure"
    end
  end
    


end