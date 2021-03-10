require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a new word and tests CRUD', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('user', :with => 'Atom')
    fill_in('word', :with => 'Photon')
    click_on('Add Word')
    expect(page).to have_content('Photon')
    click_on('Photon')
    click_on('Edit Word')
    fill_in('word', :with => 'Quantum')
    click_on('Update Word')
    expect(page).to have_content('Quantum')
    click_on('Quantum')
    click_on('Edit Word')
    click_on('Delete Word')
    expect(page).to have_no_content('Quantum')
  end
end

describe('creates a new defintion and tests CRUD', {:type => :feature}) do
  it('creates a new defintion and tests CRUD functionality') do
    word1 = Word.new({:user_word => "Photon", :user => "Epsilon", :id => nil})
    word1.save
    visit('/words')
    click_on('Photon')
    fill_in('user', :with => 'Atom')
    fill_in('definition', :with => "The individual atoms of a photograph." )
    click_on('Add Definition')
    expect(page).to have_content('The individual atoms of a photograph.')
    click_on('The individual atoms of a photograph.')
    fill_in('definition', :with => 'Energy of photos')
    click_on('Update Definition')
    expect(page).to have_content('Energy of photos')
    click_on('Energy of photos')
    click_on('Delete Definition')
    expect(page).to have_no_content('Energy of photos')
  end
end