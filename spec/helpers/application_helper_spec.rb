require 'rails_helper'
describe 'ApplicationHelper' do
  describe '#some_method_to_test' do
    it "returns 'result'" do
      expect(helper.some_method_to_test).to eq 'result'
    end
  end
  describe '#some_method_with_conditionals' do
    it "returns 'yes' if I pass in 'true'" do
      expect(helper.some_method_with_conditionals(true)).to eq 'yes'
    end
  end
  describe '#some_method_with_ternary' do
    it "returns 'yes' if I pass in 'true'" do
      expect(helper.some_method_with_ternary(true)).to eq 'yes'
    end
  end

end