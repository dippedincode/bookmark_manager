class Bookmark

  require 'pg'

  def self.all
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
   
    conn = PG.connect( dbname: @db_name )
    result = conn.exec('SELECT * FROM bookmarks;')
    res2 = result.map { |bookmark| bookmark['url'] }
    p res2
    res2
  end
  
  def self.add(url)
    p "peeing url_add"
    p url
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
   
    conn = PG.connect( dbname: @db_name )
    result = conn.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    p result
    result
  end

end
