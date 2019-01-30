class Bookmark

  require 'pg'

  def self.all
    
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
   
    conn = PG.connect( dbname: @db_name )
    result = conn.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end
  
end
