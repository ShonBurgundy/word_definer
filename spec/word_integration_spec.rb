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

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the definition page') do
    word = Word.new({:name => "fun", :id => nil})
    word.save()
    visit("/words/#{word.id}")
    fill_in('clarif', :with => 'joy')
    click_on('Add Definition')
    expect(page).to have_content("joy")
  end
end

describe('create a delete path', {:type => :feature}) do
  it('deletes a word then goes to homepage') do
    word = Word.new({:name => "dumb", :id => nil})
    word.save()
    visit("/words/#{word.id}")
    click_on('Delete Word')
    expect(page).not_to have_content("dumb")
  end
end