require 'pg'

feature 'Adding bookmarks' do

  scenario 'A user can add new bookmarks' do
    p "this test is running"
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmarks/add')
    fill_in 'url', with: 'http://www.linkedin.com'
    fill_in 'title', with: 'LinkedIn'
    click_button('Submit')

    visit('/bookmarks/add')
    fill_in 'url', with: 'http://www.vodafone.com'
    fill_in 'title', with: 'Vodafone'
    click_button('Submit')

    visit('/bookmarks/add')
    fill_in 'url', with: 'http://www.reddit.com'
    fill_in 'title', with: 'Reddit'
    click_button('Submit')

    expect(page).to have_link('LinkedIn', href: 'http://www.linkedin.com')
    expect(page).to have_link('Vodafone', href: 'http://www.vodafone.com')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com')
  end
end
