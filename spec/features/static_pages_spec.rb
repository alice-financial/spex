require 'rails_helper'
describe 'Static Pages' do

  describe 'root page' do
    before do
      visit root_path
    end

    it 'has the expected title' do
      expect(page).to have_css('h1', text: 'Spex')
    end

    it 'has a link to create a new user' do
      expect(page).to have_tag('a', with: {href: new_stripe_user_path} )
    end

  end
end