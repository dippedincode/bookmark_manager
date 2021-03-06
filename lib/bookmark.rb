require 'pg'

class Bookmark
  
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
    conn = PG.connect( dbname: @db_name )
    result = conn.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end
  
  def self.add(url:, title:)
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
    conn = PG.connect( dbname: @db_name )
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
    conn = PG.connect( dbname: @db_name )
    conn.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
    conn = PG.connect( dbname: @db_name )
    result = conn.exec("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id} RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    @db_name = (ENV['ENVIRONMENT'] == 'test') ? 'bookmark_manager_test' : 'bookmark_manager'
    conn = PG.connect( dbname: @db_name )
    result = conn.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
