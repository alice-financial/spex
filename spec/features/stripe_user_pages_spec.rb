require 'rails_helper'
require 'stripe_mock'
describe 'stripe user Pages' do
  before { StripeMock.start }
  after { StripeMock.stop }

  let(:card_error_message) {"some error message"}
  let(:card_error) {Stripe::CardError.new(card_error_message, nil, 'card_declined', '402')}
  describe 'new user' do
    let(:good_email) {'test@example.com'}
    let(:good_name) {'paul'}
    let(:card_token) {StripeMock.generate_card_token(last4: "9191", exp_year: 2015)}
    before do
      visit new_stripe_user_path
    end
    describe 'entering bad data' do

      before do
        populate_email
        populate_card_token
        populate_name
      end
      it 'displays an error if no name given' do
        populate_name nil
        submit_form
        expect(page).to have_content("Name can't be blank")
      end
      it 'shows an error if no email given' do
        populate_email nil
        submit_form
        expect(page).to have_content("Email can't be blank")
      end
      it 'shows an error if no card details given' do
        populate_card_token nil
        submit_form
        expect(page).to have_content("Payment details must be entered")
      end

      # NB - we expect stripe checkout.js to handle basic card entry errors
      # and our job is not to test that. However, there are circumstances where
      # the card token is returned, but attaching it to a customer fails with a card error.
      # @see https://stripe.com/docs/testing#cards
      it "shows an error on the page if we get a card error from stripe" do
        StripeMock.prepare_error(card_error, :new_customer)
        submit_form
        expect(page).to display_flash_message(:error, "Something went wrong: #{card_error_message}")
      end
    end
    describe 'entering good data' do
      before do
        populate_email
        populate_name
        populate_card_token
      end
      it 'shows the users page' do
        submit_form
        expect(current_path).to eq stripe_users_path
      end
      it 'adds a user to the db' do
        expect{submit_form}.to change{StripeUser.count}.by(1)
      end
      it "shows a 'user added' message" do
        submit_form
        expect(page).to display_flash_message(:notice, "Added user #{good_name}")
      end
    end
  end
  def populate_email(email=good_email)
    fill_in('stripe_user_email', with: email )
  end
  def populate_name(name=good_name)
    fill_in('stripe_user_name', with: name )
  end
  def populate_card_token(token=card_token)
    find(:xpath, "//input[@id='stripe_user_card_token']").set token
  end
  def submit_form
    click_link_or_button('submit_form')
  end
  def display_flash_message(message_type, message)
    have_css("div.alert-#{message_type}", text: message)
  end
  describe 'users index' do
    let!(:user1){create(:stripe_user)}
    let!(:user2){create(:stripe_user)}
    let(:users){[user1,user2]}
    before do
      visit stripe_users_path
    end
    it "shows an entry for each user" do
      users.each do |user|
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.email)
      end
    end

    describe 'charging a good user' do
      before do
        within("#charge_user_#{user1.id}") do
          fill_in 'quantity', :with => '2.99'
          submit_form
        end
      end
      it 'shows a success message' do
        expect(page).to display_flash_message(:notice, "Successfully charged #{user1.name} $2.99")
      end
    end
    describe "charging a 'card declined' user" do
      before do
        StripeMock.prepare_error(card_error)
        within("#charge_user_#{user1.id}") do
          fill_in 'quantity', :with => '2.99'
          submit_form
        end
      end
      it 'shows a card declined message' do
        expect(page).to display_flash_message(:error, "Something went wrong: #{card_error_message}")
      end
    end
  end
end