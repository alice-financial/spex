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

class StripeUser < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
