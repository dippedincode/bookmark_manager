require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/bookmarks/' do
    p "testing /bookmarks/"
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end


  run! if app_file == $0

end
