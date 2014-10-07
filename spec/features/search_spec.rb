require 'rails_helper'

feature "Search", :type => :feature do
=begin
  scenario 'search near station' do
    visit root_path
    expect(page).to have_content('検索')
  end

  scenario 'display train location' do
    visit root_path
    click_button '検索'
  end
=end
end
