# == Schema Information
#
# Table name: stripe_users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  stripe_id  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe StripeUser, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
