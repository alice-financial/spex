require 'rails_helper'
describe 'Static Pages', type: :request do

  describe 'root page' do
    before do
      get '/'
    end

    it 'has the expected title' do
      expect(response.body).to include('<h1>Spex</h1>')
    end

    it 'has a link to my blog' do
      expect(response.body).to include("<a href='http://eyefodder.com' target='_blank'>")
    end

  end
end