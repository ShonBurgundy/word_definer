  
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/')
    click_on('Add a new word')
    fill_in('word_name', :with => 'fun')
    click_on('Click Here')
    expect(page).to have_content('fun')
  end
end

describe('create an artist path', {:type => :feature}) do
  it('creates an artist and then goes to the artist page') do
    word = Word.new({:name => "fun", :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('clarif', :with => 'joy')
    click_on('Add Definition')
    expect(page).to have_content("joy")
  end
end