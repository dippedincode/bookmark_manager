UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id} RETURNING id, title, url;
  // #{title}, #{url} and #{id} are all variables