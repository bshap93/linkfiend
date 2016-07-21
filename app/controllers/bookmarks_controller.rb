
class BookmarksController < ApplicationController
  enable :sessions
  use Rack::Flash

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
    if params[:link]
      @bookmark.link = params[:link]
    else
      flash[:message] = "No link given"
      redirect to "/failure"
    end
    if !params[:name].empty?
      @bookmark.name = params[:name]
    else
      @bookmark.name = TitleScraper.new(@bookmark.link).title
    end
    binding.pry
    @bookmark.link = params[:link]
    @bookmark.description = params[:description]
    if params[:secret] == "on"
      @bookmark.secret = true
    end
    if params[:bookmarks]
      params[:bookmarks][:tag_ids].each do |tag_id|
        @bookmark.tags << Tag.find(tag_id)
      end
    end
    if !params[:tag][:name].empty?
      @bookmark.tags << Tag.create(name: params[:tag][:name])
    end
    @bookmark.user = current_user
    @bookmark.save
    flash[:message] = "Successfully Created Bookmark!"
    redirect to "/my_bookmarks"
  end

  delete "/bookmarks/:slug/delete" do
    @bookmark = Bookmark.find_by_slug(params[:slug])
    binding.pry
    @bookmark.delete
    flash[:message] = "Successfully Deleted Bookmark!"
    redirect to "/my_bookmarks"
  end

end