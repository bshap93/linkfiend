class BookmarksController < ApplicationController

  get '/my_bookmarks' do
    @user = current_user
    if logged_in?
      erb :'bookmarks/user_bookmarks'
    else
      redirect to "/failure"
    end


  end
end