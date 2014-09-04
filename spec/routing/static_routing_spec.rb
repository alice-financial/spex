require 'rails_helper'
describe 'Static Routing' do

  describe 'root path' do
    it 'routes to the static#home path' do
      expect(:get => root_path).to route_to(:controller => "static",
                                            :action => "home")
    end
  end
end