
class BookmarksController < ApplicationController


  get '/my_bookmarks' do
    @user = current_user
    if logged_in?
      erb :'bookmarks/user_bookmarks'
    else
      redirect to "/login"
    end
  end

  get '/bookmarks/new' do
    if logged_in?
      erb :'bookmarks/new'
    else
      redirect to "/login"
    end  
  end

  get "/bookmarks/:slug/edit" do
    @bookmark = Bookmark.find_by_slug(params[:slug])
    if @bookmark.user == current_user
      erb :'bookmarks/edit'
    else
      flash[:message] = "You can only edit your own bookmarks"
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
    @bookmark.link = params[:link]
    if !params[:description].empty?
      @bookmark.description = params[:description]
    else
      @bookmark.description = DescriptionScraper.new(@bookmark.link).description
    end
      
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

  patch '/bookmarks/:slug/edit' do
    @bookmark = Bookmark.find_by_slug(params[:slug])
    if params[:link]
      @bookmark.link = params[:link]
    else
      flash[:message] = "No link given"
      redirect to "/failure"
    end
    if !params[:name].empty?
      @bookmark.update(name: params[:name])
    else
      @bookmark.update(name: TitleScraper.new(@bookmark.link).title)
    end
    @bookmark.update(link: params[:link])
    @bookmark.update(description: params[:description])
    if params[:secret] == "on"
      @bookmark.update(secret: true)
    else
      @bookmark.update(secret: false)
    end
    @bookmark.tags.clear
    if params[:bookmarks]
      params[:bookmarks][:tag_ids].uniq.each do |tag_id|
        @bookmark.tags << Tag.find(tag_id)
      end
    end
    if !params[:tag][:name].empty?
      @bookmark.tags << Tag.find_or_create_by(name: params[:tag][:name])
    end
    @bookmark.save
    flash[:message] = "Successfully Edited Bookmark!"
    redirect to "/my_bookmarks"
  end

  delete "/bookmarks/:slug/delete" do
    @bookmark = Bookmark.find_by_slug(params[:slug])
    @bookmark.delete
    flash[:message] = "Successfully Deleted Bookmark!"
    redirect to "/my_bookmarks"
  end

  get "/bookmarks/tags/:slug" do 
    if logged_in?
      @tag = Tag.find_by_slug(params[:slug])
      erb :'bookmarks/tag'
    else 
      redirect to "/login"
    end
  end

end