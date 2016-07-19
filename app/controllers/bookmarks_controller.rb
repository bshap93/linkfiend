class BookmarksController < ApplicationController

  get '/my_bookmarks' do
    @user = current_user
    if logged_in?
      erb :'bookmarks/user_bookmarks'
    else
      redirect to "/failure"
    end
  end

  get '/bookmarks/new' do
    if logged_in?
      erb :'bookmarks/new'
    else
      redirect to "/failure"
    end  
  end

  post '/bookmarks' do
    @bookmark = Bookmark.new(name: params[:name])
    @bookmark.link = params[:link]
    @bookmark.description = params[:description]
    if params[:secret] == "on"
      @bookmark.secret = true
    end
    params[:bookmarks][:tag_ids].each do |tag_id|
      @bookmark.tags << Tag.find(tag_id)
    end
    if !params[:tag][:name].empty?
      @bookmark.tags << Tag.create(name: params[:tag][:name])
    end
    @bookmark.save
    binding.pry
  end


end