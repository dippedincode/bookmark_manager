require 'pg'

feature 'Viewing bookmarks' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do
    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.add(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
