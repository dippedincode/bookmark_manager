require 'pg'

feature 'Updating bookmarks' do

  scenario 'A user can update an existing bookmark' do
    bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
   
    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
    
    fill_in('title', with: 'Man City')
    fill_in('url', with: 'http://www.mancity.com')
   
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Man City', href: 'http://www.mancity.com')
  end
end
