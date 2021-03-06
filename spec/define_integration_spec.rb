require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Definition path', {:type => :feature}) do
  it('processes the user entry and adds a new word') do
    visit('/words/new')
    fill_in('name', :with => 'Salamander')
    click_button('Add')
    expect(page).to have_content('Your submission was successful!')
  end
end
