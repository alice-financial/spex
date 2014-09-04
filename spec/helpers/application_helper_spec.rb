require 'rails_helper'
describe 'ApplicationHelper' do
  describe '#some_method_to_test' do
    it "returns 'result'" do
      expect(helper.some_method_to_test).to eq 'result'
    end
  end

end