require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a new word', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('user', :with => 'Atom')
    fill_in('word', :with => 'Photon')
    click_on('Add Word')
    expect(page).to have_content('Photon')
  end
end